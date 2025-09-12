// import 'package:flutter/material.dart';
// import 'package:flutter_lakshman1020/core/theme/app_theme.dart';
// import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
// import 'package:flutter_lakshman1020/features/settings/settings_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp (
//       // title: 'Flutter Demo',
//       theme: AppTheme.light,
//       home: SettingsScreen(),
//       // home: Scaffold(
//       //   body: Center(
//       //     child: CustomAppBar(title: 'Demo AppBar', onBack: () { print('Back pressed'); }),
//       //   ),
//       // ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:flutter_lakshman1020/core/theme/app_theme.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/reset_password_info_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/contact_support_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/custom_support_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/safety_policy_screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/Reset_PassWord_Screen.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/settings_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      // home: SettingsScreen(),
      // home: ContactScreen(),
      // home: CustomSupportScreen(),
      home: ResetPasswordInfoScreen(),
    );
  }
}
