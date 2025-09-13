import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/widgets/FAQ_Items.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/widgets/custom_shadow_title.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/widgets/highlighted_text.dart';
import 'package:get/get.dart';

import '../../controller/box_controller.dart'; // your controller

class ResetPasswordInfoScreen extends StatelessWidget {
  ResetPasswordInfoScreen({super.key});

  final FAQController controller = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: "Reset Password",
        titleCenter: true,
        onBack: () => Get.back(),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 48),

            Obx(() {
              if (!controller.isExpanded.value) {
                // 🔹 Show button when collapsed
                return CustomShadowTile(title: 'How do I reset my password?', onPressed: controller.expand);
              }

              // 🔹 Show container when expanded
              return Container(
                height: 400,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: TColors.white1,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    FAQItem(
                      question: "How do I reset my password?",
                      description:
                      "If you’ve forgotten your password or want to \nchange it:",
                      bulletPoints: const [
                        "Go to the Login screen.",
                        "Tap 'Forgot Password?'",
                        "Enter your registered phone number or \nemail.",
                        "You’ll receive an OTP (One-Time Password) \nto verify your identity.",
                        "Enter the OTP and set a new password.",
                      ],
                      descriptionColor: TColors.deliveryDetails,
                      onPressed: controller.collapse,
                    ),

                    const SizedBox(height: 12),

                    const HighlightedTextBox(
                      text:
                      "Make sure your new password is at least 6 characters and easy for you to remember, but hard for others to guess",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 80,
                      barHeight: 60,
                      barWidth: 4,
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 16),

            // Bottom text
            Row(
              children: [
                const Text(
                  "Need more help? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: TColors.deliveryDetails,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // TODO: Implement navigation to support page
                  },
                  child: const Text(
                    "Contact Support",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: TColors.primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
