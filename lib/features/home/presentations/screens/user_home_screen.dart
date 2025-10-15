import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/features/home/presentations/widgets/user_home_widgets/banner_section.dart';
import 'package:flutter_lakshman1020/features/home/presentations/widgets/user_home_widgets/header_section.dart';
import 'package:flutter_lakshman1020/features/home/presentations/widgets/user_home_widgets/recent_shipment_header.dart';
import 'package:flutter_lakshman1020/features/home/presentations/widgets/user_home_widgets/shipment_filter_tabs.dart';
import 'package:flutter_lakshman1020/features/home/presentations/widgets/user_home_widgets/shipment_item.dart';
import 'package:flutter_lakshman1020/dummy_data.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../core/widgets/custom_bottom_nav.dart';

class UserHomeScreen extends StatefulWidget {

  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const BannerSection(),
              const SizedBox(height: 20),
              const RecentShipmentHeader(),
              const SizedBox(height: 12),
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
