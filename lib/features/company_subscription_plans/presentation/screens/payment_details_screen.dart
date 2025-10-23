import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';

import '../../models/subscription_model.dart';
import '../widgets/subscribe_button.dart';

class PaymentDetailsScreen extends StatefulWidget {
  final SubscriptionPlan selectedPlan;

  const PaymentDetailsScreen({
    super.key,
    required this.selectedPlan,
  });

  @override
  State<PaymentDetailsScreen> createState() => _PaymentDetailsScreenState();
}

class _PaymentDetailsScreenState extends State<PaymentDetailsScreen> {
  String selectedPaymentMethod = 'Stripe';

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: "Payment details", titleCenter: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            
            // Selected Plan Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2B5DCB), width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Plan name with most popular badge
                  Row(
                    children: [
                      Text(
                        widget.selectedPlan.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF18191A),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF2B5DCB),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          "Most popular",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.check_circle,
                        color: Color(0xFF2B5DCB),
                        size: 24,
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Price
                  Text(
                    "\$ ${widget.selectedPlan.price}/${_getPeriodText(widget.selectedPlan.period)}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF18191A),
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Description
                  const Text(
                    "best of small delivery service, great choice",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Payment method section
            const Text(
              "Payment method",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF18191A),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Stripe payment option
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF9FAFB),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE5E7EB)),
              ),
              child: Row(
                children: [
                  const Text(
                    "Stripe",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF18191A),
                    ),
                  ),
                  const Spacer(),
                  Radio<String>(
                    value: 'Stripe',
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value!;
                      });
                    },
                    activeColor: const Color(0xFF2B5DCB),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Notification text
            const Text(
              "We'll notify you a week before your subscription ends so you have plenty of time to renew",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF6B7280),
                height: 1.4,
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Price display
            Text(
              "\$ ${widget.selectedPlan.price}",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF18191A),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Subscribe button
            SubscribeButton(
              text: "Subscribe now",
              onPressed: () {
                _handleSubscription();
              },
            ),
            
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  String _getPeriodText(String period) {
    switch (period.toLowerCase()) {
      case 'm':
        return 'month';
      case 'y':
        return 'year';
      default:
        return period;
    }
  }

  void _handleSubscription() {
    // Handle subscription logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Subscription Confirmed"),
          content: Text(
            "You have successfully subscribed to the ${widget.selectedPlan.name} plan for \$${widget.selectedPlan.price}/${_getPeriodText(widget.selectedPlan.period)}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Go back to previous screen
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}