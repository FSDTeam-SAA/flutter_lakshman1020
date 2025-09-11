import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/widgets/primary_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: context.primaryButton(
            onPressed: (){},
            text: 'Primary Button',
          ),
        ),
      ),
    );
  }
}
