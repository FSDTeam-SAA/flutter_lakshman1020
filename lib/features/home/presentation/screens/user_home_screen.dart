import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/features/home/presentation/widgets/banner_section.dart';
import 'package:flutter_lakshman1020/features/home/presentation/widgets/header_section.dart';
import 'package:flutter_lakshman1020/features/home/presentation/widgets/recent_shipment_header.dart';
import 'package:flutter_lakshman1020/features/home/presentation/widgets/shipment_filter_tabs.dart';
import 'package:flutter_lakshman1020/features/home/presentation/widgets/shipment_item.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 20),
              const BannerSection(),
              const SizedBox(height: 20),
              const RecentShipmentHeader(),
              const SizedBox(height: 12),
              const ShipmentFilterTabs(),
              const SizedBox(height: 12),
              // Example list of shipments
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ShipmentItem();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}