import 'package:flutter_lakshman1020/core/base/base_controller.dart';
import 'package:flutter_lakshman1020/features/accounts/controller/account_controller.dart';
import 'package:flutx_core/flutx_core.dart';
import 'package:get/get.dart';

import '../../data/models/fetch_plans_request_model.dart';
import '../../data/models/fetch_plans_response_model.dart';
import '../../data/models/subscription_model.dart';
import '../../domain/subscription_repo.dart';

class SubscriptionController extends BaseController {
  final SubscriptionRepository _subscriptionRepository;
  final AccountController _accountController = Get.find<AccountController>();

  SubscriptionController(this._subscriptionRepository);

  // Observable list of plans from API
  final RxList<FetchPlansResponseModel> apiPlans =
      <FetchPlansResponseModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Wait for user info to be available before fetching plans
    _waitForUserInfoAndFetch();
  }

  // Wait for user info to load, then fetch plans
  Future<void> _waitForUserInfoAndFetch() async {
    // Wait for userInfo to be populated (max 5 seconds)
    int attempts = 0;
    while ((_accountController.userInfo.value?.email == null || 
            _accountController.userInfo.value!.email.isEmpty) && 
           attempts < 50) {
      await Future.delayed(const Duration(milliseconds: 100));
      attempts++;
    }
    
    // Now fetch plans
    await fetchPlansFromApi();
  }

  // Fetch plans from API
  Future<void> fetchPlansFromApi() async {
    try {
      setLoading(true);
      setError('');

      final email = _accountController.userInfo.value?.email;
      if (email == null || email.isEmpty) {
        setError('User email not found. Please try again.');
        setLoading(false);
        DPrint.error("❌ Cannot fetch plans: User email is null");
        return;
      }

      DPrint.log("🔍 Fetching plans for email: $email");

      final request = FetchPlansRequestModel(email: email);
      final result = await _subscriptionRepository.fetchPlans(request);

      result.fold(
        (failure) {
          setError(failure.message);
          DPrint.error("❌ Failed to fetch plans: ${failure.message}");
          setLoading(false);
        },
        (success) {
          apiPlans.value = success.data;
          DPrint.log(
              "✅ Successfully loaded ${success.data.length} plans from API");
          setLoading(false);
        },
      );
    } catch (e) {
      setError(e.toString());
      DPrint.error("❌ Exception fetching plans: $e");
      setLoading(false);
    }
  }

  // Convert API plan to SubscriptionPlan for UI compatibility
  SubscriptionPlan convertToSubscriptionPlan(FetchPlansResponseModel apiPlan) {
    return SubscriptionPlan(
      name: apiPlan.name,
      price: apiPlan.price.toString(),
      period: "m",
      features: apiPlan.features
          .map((feature) => SubscriptionFeature(
                title: feature,
                value: true,
              ))
          .toList(),
    );
  }

  // Get all subscription plans (now from API)
  List<SubscriptionPlan> getAllPlans() {
    if (apiPlans.isEmpty) {
      // Return empty list if API hasn't loaded yet
      return [];
    }
    return apiPlans.map((plan) => convertToSubscriptionPlan(plan)).toList();
  }
}