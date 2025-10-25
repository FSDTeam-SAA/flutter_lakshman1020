import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../../data/models/subscription_model.dart';
import '../controllers/subscription_controller.dart';
import '../widgets/page_indicator.dart';
import '../widgets/subscribe_button.dart';
import '../widgets/subscription_card.dart';
import 'payment_details_screen.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  final PageController _pageController = PageController();
  final SubscriptionController _controller = SubscriptionController();
  int _currentPageIndex = 0;
  late List<SubscriptionPlan> _plans;

  @override
  void initState() {
    super.initState();
    _plans = _controller.getAllPlans();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: "Subscription plans", titleCenter: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 29),
            
            // PageView for subscription cards
            SizedBox(
              height: 580, // Fixed height for PageView
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _plans.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SubscriptionCard(
                      plan: _plans[index],
                      isPopular: index == 1, // Mark Premium (index 1) as popular
                      onSubscribe: () {
                        Get.to(
                          () => PaymentDetailsScreen(plan: _plans[index]),
                          transition: Transition.rightToLeft,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Page indicator
            PageIndicator(
              currentPage: _currentPageIndex,
              totalPages: _plans.length,
            ),
            
            const SizedBox(height: 20),
            
            // Subscribe button for current plan
            SubscribeButton(
              text: "Subscribe to ${_plans[_currentPageIndex].name}",
              onPressed: () {
                Get.to(
                  () => PaymentDetailsScreen(plan: _plans[_currentPageIndex]),
                  transition: Transition.rightToLeft,
                );
              },
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}