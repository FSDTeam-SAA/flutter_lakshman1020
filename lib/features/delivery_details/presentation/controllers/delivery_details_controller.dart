import 'package:get/get.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/constants/api_constants.dart';

import '../../data/services/geocoding_service.dart';
import '../../../home/data/models/load_model.dart';

class DeliveryDetailsController extends GetxController {
  var deliveryList = <Map<String, String>>[].obs;
  var selectedIndex = 0.obs;

  /// Dynamic title used by the page app bar. Defaults to a fallback title.
  final currentTitle = 'Delivery Details'.obs;

  /// 0 - pending, 1 - processing, 2 - delivered
  final currentStep = 0.obs;

  final pickupDateString = ''.obs;

  final String? initialLoadId;

  DeliveryDetailsController({this.initialLoadId});

  @override
  void onInit() {
    super.onInit();
    if (initialLoadId != null && initialLoadId!.isNotEmpty) {
      // If an ID was passed to the page, use it as the source of truth
      fetchLoadDetailById(initialLoadId!);
    } else {
      fetchDeliveryDetails();
    }
  }

  /// Simulates an API call using the model you provided in the task.
  /// Maps the API keys into UI-friendly labels that the existing
  /// `DeliveryInfoCard` widget expects.
  Future<void> fetchDeliveryDetails() async {
    try {
      // Simulate network latency
      await Future.delayed(const Duration(milliseconds: 700));

      // Dummy API response based on the model you provided
      final apiResponse = {
        "data": {
          "title": "Furniture Delivery",
          "description":
              "Delivery of office furniture from warehouse to client",
          "category": "furniture",
          "pickupLocation": "23.8160968,90.4280376",
          "deliveryLocation": "23.7808132,90.4074913",
          "companyToken": "68e9cee3c24ab343ad8335b1",
          "loadBy": "68f468d660f8f7494c8bb030",
          "orderStatus": "pending",
          "pickupDate": "2023-12-15T10:00:00.000Z",
          "note": "Fragile items, handle with care",
          "_id": "68f4778f32d6fe9a7cbd688b",
          "createdAt": "2025-10-19T05:30:55.424Z",
          "updatedAt": "2025-10-19T05:30:55.424Z",
          "__v": 0,
        },
      };

      final data = apiResponse['data'] ?? {};

      // If API returned an ID, attempt to fetch the full load details from backend
      final serverId = data['_id']?.toString();

      final geocoding = GeocodingService();
      // Resolve pickup and delivery addresses (will simulate if no API key)
      final pickupLatLng = (data['pickupLocation'] ?? '').toString();
      final deliveryLatLng = (data['deliveryLocation'] ?? '').toString();

      // Debug: log the raw lat/lng values
      print(
        'DeliveryDetailsController: pickupLatLng="$pickupLatLng" deliveryLatLng="$deliveryLatLng"',
      );

      final pickupAddressModel = await geocoding.getAddressFromLatLng(
        pickupLatLng,
      );
      print(
        'DeliveryDetailsController: resolved pickupAddress="${pickupAddressModel.formattedAddress}"',
      );

      final deliveryAddressModel = await geocoding.getAddressFromLatLng(
        deliveryLatLng,
      );
      print(
        'DeliveryDetailsController: resolved deliveryAddress="${deliveryAddressModel.formattedAddress}"',
      );

      // Build the UI-friendly map. Keys intentionally human-readable because
      // DeliveryInfoCard shows the map keys as labels.
      final mapped = <String, String>{
        'title': (data['title'] ?? 'Delivery Details').toString(),
        // Driver info / contact / delivery id remain untouched for now
        'Driver Name': 'Michael ken',
        'Mobile': '+7853665363',
        'Pickup Address': pickupAddressModel.formattedAddress,
        'Delivery Address': deliveryAddressModel.formattedAddress,
        'Delivered Date': _formatDateSafe(data['pickupDate']?.toString()),
        'Delivered ID': '#ABC567#7BG6',
        // productDescription is used by ProductDetailsCard below
        'productDescription': (data['description'] ?? '').toString(),
      };

      // Set the title for the app bar dynamically
      currentTitle.value = mapped['title'] ?? currentTitle.value;

      deliveryList.value = [mapped];

      if (serverId != null && serverId.isNotEmpty) {
        // fire and set status/date from server if available
        await fetchLoadDetailById(serverId);
      }
    } catch (e) {
      // Keep the list empty and log the error
      print('Error fetching delivery details: $e');
      deliveryList.value = [];
    }
  }

  Future<void> fetchLoadDetailById(String id) async {
    try {
      final apiClient = ApiClient();
      final endpoint = ApiConstants.load.getById(id);

      final response = await apiClient.get<Map<String, dynamic>>(
        endpoint,
        fromJsonT: (json) => json as Map<String, dynamic>,
      );

      response.fold(
        (failure) {
          // ignore failures and keep current UI
        },
        (success) {
          final data = success.data;
          // data is expected to be the load object
          final load = LoadModel.fromJson(data);

          // Map orderStatus to step
          switch (load.orderStatus.toLowerCase()) {
            case 'pending':
              currentStep.value = 0;
              break;
            case 'processing':
              currentStep.value = 1;
              break;
            case 'delivered':
              currentStep.value = 2;
              break;
            default:
              currentStep.value = 0;
          }

          pickupDateString.value = _formatDateSafe(
            load.pickupDate.toIso8601String(),
          );

          // Resolve pickup/delivery addresses using geocoding service
          final geocoding = GeocodingService();
          // These are lat,long strings in the model
          final pickupLatLng = load.pickupLocation;
          final deliveryLatLng = load.deliveryLocation;

          // Fire geocoding (await to ensure we have addresses)
          Future.wait([
            geocoding.getAddressFromLatLng(pickupLatLng),
            geocoding.getAddressFromLatLng(deliveryLatLng),
          ]).then((results) {
            final pickupAddress = results[0].formattedAddress;
            final deliveryAddress = results[1].formattedAddress;

            final mapped = <String, String>{
              'title': load.title,
              'Driver Name': 'Michael ken',
              'Mobile': '+7853665363',
              'Pickup Address': pickupAddress,
              'Delivery Address': deliveryAddress,
              'Delivered Date': pickupDateString.value,
              'Delivered ID': load.id,
              'productDescription': load.description,
            };

            // Update title and list
            currentTitle.value = load.title;
            deliveryList.value = [mapped];
          });
        },
      );
    } catch (e) {
      print('Error fetching load by id: $e');
    }
  }

  String _formatDateSafe(String? iso) {
    if (iso == null || iso.isEmpty) return '';
    try {
      final dt = DateTime.parse(iso).toLocal();
      final dd = dt.day.toString().padLeft(2, '0');
      final mm = dt.month.toString().padLeft(2, '0');
      final yyyy = dt.year.toString();
      return '$dd/$mm/$yyyy';
    } catch (_) {
      return iso.split('T').first; // fallback to date portion if parse fails
    }
  }
}
