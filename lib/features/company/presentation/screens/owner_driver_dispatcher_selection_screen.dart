import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_images.dart';

class RoleController extends GetxController {
  var selectedIndex = 0.obs;

  final List<String> roles = ["Owner", "Driver", "Dispatcher"];
  final List<String> listImages = [
    AppImages.owner,
    AppImages.driver,
    AppImages.dispatcher,
  ];

  void selectRole(int index) {
    selectedIndex.value = index;
  }
}

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RoleController());

    return AppScaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // --- Dot Indicators ---
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  controller.roles.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.selectedIndex.value == index
                          ? Colors.blue
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),

            // --- Image Stack Section ---
            SizedBox(
              height: 260,
              child: Obx(() {
                // order: non-selected first, selected last → on top
                final orderedIndexes = [
                  for (int i = 0; i < controller.listImages.length; i++)
                    if (i != controller.selectedIndex.value) i,
                  controller.selectedIndex.value,
                ];

                return Stack(
                  alignment: Alignment.center,
                  children: orderedIndexes.map((index) {
                    // fixed triangle positions
                    double offsetX = 0;
                    double offsetY = 0;

                    if (index == 0) {
                      offsetX = -100; // left
                      offsetY = 30;
                    } else if (index == 1) {
                      offsetX = 100; // right
                      offsetY = 30;
                    } else {
                      offsetY = -10; // top center
                    }

                    return AnimatedPositioned(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      left:
                          MediaQuery.of(context).size.width / 2 + offsetX - 70,
                      top: 20 + offsetY,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100), // oval
                        child: Image.asset(
                          controller.listImages[index],
                          height: 200,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                );
              }),
            ),

            const SizedBox(height: 20),

            const SizedBox(height: 30),

            // --- Buttons ---
            Obx(
              () => Column(
                children: List.generate(controller.roles.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.selectedIndex.value == index
                            ? Colors.blue.shade100
                            : Colors.grey.shade200,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(180, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        controller.selectRole(index);
                      },
                      child: Text(controller.roles[index]),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
