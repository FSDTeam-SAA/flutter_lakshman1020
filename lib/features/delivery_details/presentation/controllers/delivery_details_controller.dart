import 'package:get/get.dart';

import '../../data/services/geocoding_service.dart';

class DeliveryDetailsController extends GetxController {
  var deliveryList = <Map<String, String>>[].obs;
  var selectedIndex = 0.obs;

  /// Dynamic title used by the page app bar. Defaults to a fallback title.
  final currentTitle = 'Delivery Details'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDeliveryDetails();
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
    } catch (e) {
      // Keep the list empty and log the error
      print('Error fetching delivery details: $e');
      deliveryList.value = [];
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
