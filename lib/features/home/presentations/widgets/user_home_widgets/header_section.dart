import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/constants/app_images.dart';
import 'package:flutter_lakshman1020/features/notification/presentations/screens/notification_alert.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../accounts/presentation/screens/accounts_screen.dart';

class HeaderSection extends StatelessWidget {
  const  HeaderSection({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => AccountsScreen()), // no await here
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(AppImages.accountUser),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(2),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome back, Daniel",
                    style: TextStyle(
                      color: TColors.activityColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "@daniel001",
                    style: TextStyle(
                      color: TColors.activityColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              icon: const Image(
                image: AssetImage("assets/images/notification.png"),
                height: 32,
                width: 32,
              ),
              onPressed: () => Get.to(() => NotificationAlertScreen()),
            ),
          ],
        ),
      ),
    );
  }

}
