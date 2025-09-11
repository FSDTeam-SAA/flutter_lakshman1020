import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/Theme/app_theme.dart';
import 'features/delivery_details/presentation/screens/delivery_payment_screen.dart';

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
      home: DeliveryDetailsPaymentScreen()
    );
  }
}
