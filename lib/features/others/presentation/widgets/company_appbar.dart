import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/features/notification/presentations/screens/notification_alert.dart';
import 'package:get/get.dart';

class CompanyAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CompanyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/spark_icon.png")),
          Text(
            "Spark Delivery",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: () {
              // Handle notification tap
              Get.to(
                () => const NotificationAlertScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: Image(
              height: 30,
              width: 30,
              image: AssetImage("assets/images/notification_square.png"),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
