import 'package:flutter/material.dart';

class RecentShipmentHeader extends StatelessWidget {
  const RecentShipmentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Text(
            "Recent Shipment",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("view more", style: TextStyle(color: Colors.blue)),
        ),
      ],
    );
  }
}
