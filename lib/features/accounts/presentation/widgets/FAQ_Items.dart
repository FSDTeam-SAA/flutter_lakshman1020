import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String description;
  final List<String> bulletPoints;
  final Color descriptionColor;
  final VoidCallback onPressed;


  const FAQItem({
    super.key,
    required this.question,
    required this.description,
    required this.bulletPoints,
    required this.descriptionColor, required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Question
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              question,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: TColors.deliveryDetails,
              ),
            ),
            
            IconButton(onPressed: onPressed, icon: Icon(Icons.close, color: TColors.red,))
          ],
        ),
        const SizedBox(height: 12),

        // Description
        Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: descriptionColor,
          ),
        ),
        const SizedBox(height: 12),

        // Bullet points
        ...bulletPoints.map((point) => _buildBulletPoint(point)).toList(),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left:  10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 14, color: TColors.grey1)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14, color: TColors.grey1),
            ),
          ),
        ],
      ),
    );
  }
}
