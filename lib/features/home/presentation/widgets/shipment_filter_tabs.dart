import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';

class ShipmentFilterTabs extends StatelessWidget {
  const ShipmentFilterTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ["All", "Pending", "Processing", "Delivered"];

    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = index == 0; // Example: first tab selected
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? TColors.driverNavigation : TColors.white,
              borderRadius: isSelected
                  ? BorderRadius.circular(20)
                  : BorderRadius.circular(4),
              border: Border.all(
                color: isSelected
                    ? TColors.driverNavigation
                    : TColors.driverNavigation, // Your border color
                width: 2.0, // Border width
              ),
            ),
            child: Text(
              filters[index],
              style: TextStyle(
                color: isSelected
                    ? TColors.activityColor
                    : TColors.activityColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
      ),
    );
  }
}
