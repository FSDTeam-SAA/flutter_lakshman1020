import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/theme/app_theme.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:flutter_lakshman1020/features/accounts/presentation/screens/notification_screen.dart';
import 'package:flutter_lakshman1020/features/company_package/presantation/screens/activated_screen.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/dispatcher_home_screen.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/driver_home_screen.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/user_home_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: UserHomeScreen(),
    );
  }
}
