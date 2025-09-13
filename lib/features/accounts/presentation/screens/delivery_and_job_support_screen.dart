import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/constants/appTexts.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../controller/box_controller.dart';
import '../widgets/FAQ_Items.dart';
import '../widgets/custom_shadow_title.dart';
import '../widgets/highlighted_text.dart';

class DeliveryAndJobSupportScreen extends StatelessWidget {
   DeliveryAndJobSupportScreen({super.key});

  final FAQController controller = Get.put(FAQController());

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: (appTexts.deliveryJobSupport),
        titleCenter: true,
        onBack: Get.back,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 48,),

            CustomShadowTile(title: 'How to Accept or Reject Jobs', onPressed: () {  },),
            SizedBox(height: 16,),


            Obx(() {
              if (!controller.isExpanded.value) {
                // 🔹 Show button when collapsed
                return CustomShadowTile(title: 'How do I reset my password?', onPressed: controller.expand);
              }

              // 🔹 Show container when expanded
              return Container(
                height: 350,
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
                      question: "Pickup & Drop-off Issues",
                      description:
                      "If you can’t find the pickup or drop location:",
                      bulletPoints: const [
                        "Use the “Call Customer” button to get directions.",
                        "Double-check the address pinned on the map.",
                        "Still having trouble? Tap “Report Issue” for assistance."
                      ],
                      descriptionColor: TColors.deliveryDetails,
                      onPressed: controller.collapse,
                    ),

                    const SizedBox(height: 12),

                    const HighlightedTextBox(
                      text:
                      "Wait up to 10 minutes at pickup or drop points before reporting no-show.",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 60,
                      barHeight: 40,
                      barWidth: 4,
                    ),
                  ],
                ),
              );
            }),

            SizedBox(height: 16,),

            CustomShadowTile(title: 'Navigation & Route Help', onPressed: (){},),
            SizedBox(height: 16,),
            CustomShadowTile(title: 'Customer Not Available', onPressed: (){},)
          ],
        ),
      ),
    );
  }
}
