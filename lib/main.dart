import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/theme/app_theme.dart';
import 'package:flutter_lakshman1020/features/acounts/presentation/screens/about_us_screen.dart';
import 'package:flutter_lakshman1020/features/acounts/presentation/screens/accounts_screen.dart';
import 'package:flutter_lakshman1020/features/acounts/presentation/screens/personal_details_screen.dart';
import 'package:flutter_lakshman1020/features/acounts/presentation/screens/personal_edit_screen.dart';
import 'package:get/get.dart';

import 'features/acounts/presentation/widgets/djkg.dart';
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
      home: AccountsScreen(
      )
    );
  }
}
