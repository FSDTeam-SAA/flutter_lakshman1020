import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomShadowTile extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color shadowColor;
  final Color backgroundColor;
  final IconData icon;

  const CustomShadowTile({
    super.key,
    required this.title,
    this.onPressed,
    this.shadowColor = Colors.grey,
    this.backgroundColor = TColors.white,
    this.icon = Icons.keyboard_arrow_down,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.1),
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.black, // you can replace with TColors.deliveryDetails
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, size: 25),
          ),
        ],
      ),
    );
  }
}
