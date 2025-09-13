import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/dummy_data.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/widgets/user_home_widgets/shipment_filter_tabs.dart';
import 'package:flutter_lakshman1020/features/home/presentations/screens/widgets/user_home_widgets/shipment_item.dart';

class ShipmentScreen extends StatelessWidget {
  const ShipmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ShipmentFilterTabs(),
              const SizedBox(height: 12),
              // Use Column with map
              Column(
                children: shipments.map((shipment) {
                  return ShipmentItem(shipment: shipment);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
