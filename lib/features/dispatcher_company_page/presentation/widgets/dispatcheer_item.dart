import 'package:flutter/material.dart';

class DispatcherListItem extends StatelessWidget {
  final String name;
  final String mobile;
  final VoidCallback onRemove;

  const DispatcherListItem({
    super.key,
    required this.name,
    required this.mobile,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          // Name column
          Expanded(
            flex: 3,
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF18191A),
              ),
            ),
          ),

          // Mobile column
          Expanded(
            flex: 3,
            child: Text(
              mobile,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF18191A),
              ),
            ),
          ),

          // Remove button column
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: onRemove,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    "Remove",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFD32F2F),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}