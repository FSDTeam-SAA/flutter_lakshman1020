import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';
import 'package:flutter_lakshman1020/dummy_data.dart';
import 'package:flutter_lakshman1020/features/home/presentations/widgets/user_home_widgets/shipment_filter_tabs.dart';
import 'package:flutter_lakshman1020/features/home/presentations/widgets/user_home_widgets/shipment_item.dart';

class ShipmentScreen extends StatefulWidget {
  const ShipmentScreen({super.key});

  @override
  State<ShipmentScreen> createState() => _ShipmentScreenState();
}

class _ShipmentScreenState extends State<ShipmentScreen> {
  int currentPage = 1;
  final int itemsPerPage = 7; // show 7 shipments per page

  @override
  Widget build(BuildContext context) {
    // Calculate start & end indexes
    final startIndex = (currentPage - 1) * itemsPerPage;
    final endIndex = (startIndex + itemsPerPage > shipments.length)
        ? shipments.length
        : startIndex + itemsPerPage;

    // Slice list for current page
    final currentShipments = shipments.sublist(startIndex, endIndex);

    final totalPages = (shipments.length / itemsPerPage).ceil();

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        surfaceTintColor: TColors.white,
        shadowColor: TColors.white1,
        title: const Text("Shipment"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const ShipmentFilterTabs(),
              const SizedBox(height: 12),

              // Shipment list
              Expanded(
                child: ListView(
                  children: currentShipments
                      .map((shipment) => ShipmentItem(shipment: shipment))
                      .toList(),
                ),
              ),

              // Pagination controls
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Image.asset(
                      'assets/images/arrow_back.png', // your back arrow image
                      width: 24,
                      height: 24,
                    ),
                    onPressed: currentPage > 1
                        ? () => setState(() => currentPage--)
                        : null,
                  ),

                  ...List.generate(totalPages, (index) {
                    final page = index + 1;
                    if (page == 1 ||
                        page == totalPages ||
                        (page >= currentPage - 1 && page <= currentPage + 1)) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: page == currentPage
                                ? TColors.white1
                                : Colors.white,
                            foregroundColor: page == currentPage
                                ? Colors.black
                                : Colors.black,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            minimumSize: const Size(24, 24),
                          ),
                          onPressed: () => setState(() => currentPage = page),
                          child: Text(page.toString()),
                        ),
                      );
                    } else if (page == currentPage - 2 ||
                        page == currentPage + 2) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text("..."),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/arrow_forward.png', // your forward arrow image
                      width: 24,
                      height: 24,
                    ),
                    onPressed: currentPage < totalPages
                        ? () => setState(() => currentPage++)
                        : null,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
