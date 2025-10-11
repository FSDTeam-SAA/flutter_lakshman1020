import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/theme/app_theme.dart';

import 'package:get/get.dart';

import 'core/init/app_initializer.dart';
import 'features/auth/users/presentation/screens/LogIn_screen.dart';
import 'features/auth/users/presentation/screens/SignInRoleScreen.dart';



void main() async {
  await AppInitializer.initializeApp();
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: LoginRoleScreen(),
    );
  }
}
