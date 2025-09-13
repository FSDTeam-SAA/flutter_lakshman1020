import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/app_and_technical_help_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/customer_support_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/delivery_and_job_support_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/reset_password_info_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/safety_policy_screen.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../../model/help_and_support_item.dart';

class SupportCard extends StatelessWidget {
  final SupportItem item;


  const SupportCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if (item.title == "How do I reset my password") {
          Get.to(ResetPasswordInfoScreen());
        } else if (item.title == "Safety & Policy") {
          Get.to(SafetyPolicyScreen());
        } else if (item.title == "Delivery & Job Support") {
          Get.to(DeliveryAndJobSupportScreen());
        } else if (item.title == "App & Technical Help") {
          Get.to(AppAndTechnicalHelpScreen());
        } else if (item.title == "Customer support") {
          Get.to(CustomerSupportScreen());
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: TColors.white1,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: TColors.textfieldPrefixIconBackground,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  width: 32,
                  height: 32,
                  item.image,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: TColors.deliveryDetails
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}

