import 'package:flutter/material.dart';

class FeatureItem extends StatelessWidget {
  final String title;
  final dynamic value;

  const FeatureItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    Widget valueWidget;

    if (value is bool) {
      // Show tick or cross icon
      valueWidget = Icon(
        value ? Icons.check : Icons.cancel,
        color: value ? Color(0xFF27AE60) : Color(0xFFEB5757),
        size: 20,
      );
    } else if (value is int || value is double) {
      // Show numeric value
      valueWidget = Text(
        value.toString(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF18191A),
        ),
        textAlign: TextAlign.right,
      );
    } else {
      // Show text value
      valueWidget = Text(
        value.toString(),
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Color(0xFF18191A),
        ),
        textAlign: TextAlign.right,
      );
    }

    return Container(
      width: double.infinity, // Take full width
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between title and value
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF18191A),
            ),
          ),
          valueWidget,
        ],
      ),
    );
  }
}