import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_icons.dart';
import 'package:flutter_lakshman1020/core/widgets/primary_button.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../home/models/app_text_styles.dart';



class BulletItem extends StatelessWidget {
  final String iconPath;
  final String text;

  const BulletItem({super.key, required this.iconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Image.asset(iconPath, width: 14, height: 14),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}