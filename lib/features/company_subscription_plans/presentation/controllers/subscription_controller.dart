
import '../../data/models/subscription_model.dart';

class SubscriptionController {
  SubscriptionPlan getBasicPlan() {
    return SubscriptionPlan(
      name: "Basic",
      price: "99.99",
      period: "m",
      features: [
        SubscriptionFeature(title: "Order Management", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Dispatcher", value: 10),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
      ],
    );
  }

  SubscriptionPlan getPremiumPlan() {
    return SubscriptionPlan(
      name: "Premium",
      price: "199.99",
      period: "m",
      features: [
        SubscriptionFeature(title: "Order Management", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Dispatcher", value: "Unlimited"),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Advanced Analytics", value: true),
        SubscriptionFeature(title: "Priority Support", value: true),
        SubscriptionFeature(title: "Custom Reports", value: true),
        SubscriptionFeature(title: "API Access", value: true),
      ],
    );
  }

  SubscriptionPlan getEnterprisePlan() {
    return SubscriptionPlan(
      name: "Enterprise",
      price: "499.99",
      period: "m",
      features: [
        SubscriptionFeature(title: "Order Management", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Dispatcher", value: "Unlimited"),
        SubscriptionFeature(title: "Unlimited Client", value: true),
        SubscriptionFeature(title: "Advanced Analytics", value: true),
        SubscriptionFeature(title: "Priority Support", value: true),
        SubscriptionFeature(title: "Custom Reports", value: true),
        SubscriptionFeature(title: "API Access", value: true),
        SubscriptionFeature(title: "White Label", value: true),
        SubscriptionFeature(title: "Dedicated Support", value: true),
      ],
    );
  }

  // Get all subscription plans
  List<SubscriptionPlan> getAllPlans() {
    return [
      getBasicPlan(),
      getPremiumPlan(),
      getEnterprisePlan(),
    ];
  }
}