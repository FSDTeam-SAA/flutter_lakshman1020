import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/theme/app_theme.dart';


import 'features/test/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: ExampleScreen(),
    );
  }
}
