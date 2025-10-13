import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/constants/texts.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:flutter_lakshman1020/features/accounts/model/notification_setting_model.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/widgets/notification_widget.dart';

class NotificationSettingsScreen extends StatefulWidget {
  NotificationSettingsScreen({Key? key}) : super(key: key);

  final List<NotificationSettingModel> titles = [
    NotificationSettingModel(
      title: "Job Alerts",
      subtitle:
          "Get notified when new delivery requests are \n available near you.",
      isEnabled: true,
    ),

    NotificationSettingModel(
      title: "Payment Updates",
      subtitle: "Receive alerts about trip earnings, payouts, \n and bonuses.",
      isEnabled: true,
    ),

    NotificationSettingModel(
      title: "Promotions & Announcements",
      subtitle:
          "Be the first to know about new features, \n offers, and driver incentives.",
      isEnabled: true,
    ),

    NotificationSettingModel(
      title: "App Alerts & Warnings",
      subtitle:
          "Important app updates, route issues, or \n account notifications.",
      isEnabled: false,
    ),
  ];

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: appTexts.notification,
        titleCenter: true,

        // bottom: const PreferredSize(
        //   preferredSize: Size.fromHeight(1.0),
        //   child: Divider(height: 0.9, thickness: 1, color: TColors.grey2),
        // ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 48),
          const Text(
            "Control how and when you receive \n alerts about deliveries, payments, \n and updates.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: TColors.deliveryDetails,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 48),

          // Build switches from settings list
          ...widget.titles.asMap().entries.map((entry) {
            final index = entry.key;
            final setting = entry.value;

            return NotificationWidget(
              title: setting.title,
              subtitle: setting.subtitle,
              value: setting.isEnabled,
              onChanged: (val) {
                // setState(() {
                //   widget.titles[index].isEnabled = val;
                // });
              },
            );
          }),
        ],
      ),
    );
  }
}
