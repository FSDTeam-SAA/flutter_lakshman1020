import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/core/theme/app_theme.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:flutter_lakshman1020/features/home/presentation/screens/dispatcher_home_screen.dart';
import 'package:flutter_lakshman1020/features/home/presentation/screens/driver_home_screen.dart';
import 'package:flutter_lakshman1020/features/home/presentation/screens/user_home_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: DispatcherHomeScreen(),
    );
  }
}
