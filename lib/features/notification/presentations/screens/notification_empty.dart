import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_images.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';

import '../../../home/models/app_text_styles.dart';

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: "Notifications"),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Images.jhon, width: 200,height: 200),
              const SizedBox(height: 20),
              Text("No notification yet", style: TTextStyles.title),
              const SizedBox(height: 8),
              Text(
                "Your notification will appear here once you receive them",
                style: TTextStyles.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
