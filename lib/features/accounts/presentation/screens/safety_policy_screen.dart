import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/constants/texts.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/widgets/FAQ_Items.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/widgets/custom_shadow_title.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/widgets/highlighted_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/box_controller.dart';

class SafetyPolicyScreen extends StatelessWidget {
   SafetyPolicyScreen({super.key});

  final FAQController controller = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: (appTexts.safetyPolicy), titleCenter: true,onBack: Get.back,),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 48,),
        
            CustomShadowTile(title: 'Accident or Damage Reporting', onPressed: () {  },),
            SizedBox(height: 16,),
            CustomShadowTile(title: 'Emergency Contact', onPressed: (){},),
            SizedBox(height: 16,),


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
                      question: "Customer Misconduct",
                      description:
                      "If a customer behaves inappropriately or violates our policy:",
                      bulletPoints: const [
                        "End the trip only if it’s safe to do so.",
                        "Go to Help & Support > Report a Customer Issue.",
                        "Provide a brief description of what happened (with time and location).",
                        "Our team will investigate and take appropriate action.",
                      ],
                      descriptionColor: TColors.deliveryDetails,
                      onPressed: controller.collapse,
                    ),

                    const SizedBox(height: 12),

                    const HighlightedTextBox(
                      text:
                      "All reports are confidential and taken seriously. Your safety is our priority.",
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
          ],
        ),
      ),
    );
  }
}
