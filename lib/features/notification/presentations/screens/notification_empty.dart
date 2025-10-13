import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_images.dart';
import '../../../home/models/app_text_styles.dart';

class NotificationEmptyScreen extends StatelessWidget {
  const NotificationEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // left align
              children: [
                const SizedBox(height: 48),

                Center(
                  child: Image.asset(
                    AppImages.notification1,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(height: 20),

                Text(
                  "No notification yet",
                  style: TTextStyles.title,
                ),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Your notification will appear here once you have them",
                    style: TTextStyles.no_subtitle,
                    textAlign: TextAlign.justify,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
