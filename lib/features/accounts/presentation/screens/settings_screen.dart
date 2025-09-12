// import 'package:flutter/material.dart';
// import 'package:flutter_lakshman1020/features/settings/Notification/screen/notification_settings_screen.dart';
// import 'package:get/get.dart';
// import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
// import 'package:flutter_lakshman1020/core/constants/app_images.dart';
// import 'package:flutter_lakshman1020/core/constants/texts.dart';

// import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';
// import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
// import 'package:flutter_lakshman1020/features/settings/Reset_PassWord_Screen.dart';

// class SettingsScreen extends StatefulWidget {
//   const SettingsScreen({super.key});

//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool phoneCallEnabled = true;

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffold(
//       appBar: const CustomAppBar(title: appTexts.setting),
//       body: Column(
//         children: [
//           const Divider(height: 1, thickness: 1, color: TColors.grey2),
//           const SizedBox(height: 8),
//           Expanded(
//             child: ListView(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   child: Text(
//                     appTexts.accountSettong,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: TColors.activityColor,
//                     ),
//                   ),
//                 ),

//                 /// Navigate using GetX
//                 _buildListTile(Images.resetPassIcon, "Reset password", () {
//                   Get.to(() => const ResetPasswordScreen());
//                 }),

//                 _buildListTile(Images.groupIcon, "Notification", () {
//                   Get.to(() => NotificationSettingsScreen());
//                 }),
//                 _buildListTile(Images.informationIcon, "About us", () {}),

//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   child: Text(
//                     appTexts.moreOption,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: TColors.activityColor,
//                     ),
//                   ),
//                 ),

//                 _buildSwitchTile(Images.callIcon, "Phone calls"),
//                 _buildListTile(Images.languageIcon, "Language", () {}),
//                 _buildListTile(Images.currencyIcon, "Currency", () {}),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildListTile(String imagePath, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: _buildLogo(
//         child: Image.asset(imagePath, width: 20, height: 20),
//         bgColor: TColors.white1,
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//       ),
//       trailing: const Icon(
//         Icons.arrow_forward_ios,
//         size: 16,
//         color: TColors.activityColor,
//       ),
//       onTap: onTap,
//     );
//   }

//   Widget _buildSwitchTile(String imagePath, String title) {
//     return ListTile(
//       leading: _buildLogo(
//         child: Image.asset(imagePath, width: 20, height: 20),
//         bgColor: TColors.white1,
//       ),
//       title: Text(
//         title,
//         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//       ),
//       trailing: Transform.scale(
//         scale: 0.6, // 🔹 smaller size (0.7 = smaller, 1.0 = normal)
//         child: Switch(
//           value: phoneCallEnabled,
//           onChanged: (val) {
//             setState(() {
//               phoneCallEnabled = val;
//             });
//           },
//           activeColor: TColors.enableButton,
//         ),
//       ),
//     );
//   }

//   Widget _buildLogo({required Widget child, required Color bgColor}) {
//     return Container(
//       width: 36,
//       height: 36,
//       decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
//       child: Center(child: child),
//     );
//   }
// }
