import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../controllers/delivery_details_controller.dart';

class DriverDeliveryDetailsScreen extends StatelessWidget {
  final String? loadId;

  const DriverDeliveryDetailsScreen({
    super.key,
    this.loadId,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize controller with loadId if provided
    final controller = Get.put(
      DeliveryDetailsController(initialLoadId: loadId),
      tag: loadId,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(title: 'Delivery details'),
      ),
      body: Obx(
        () {
          // Show loading while fetching
          if (controller.deliveryList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final delivery = controller.deliveryList[0];

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Center(
                  child: Text(
                    delivery['title'] ?? 'Delivery Details',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Customer Details Card
                _buildDetailRow(
                  'Driver Name',
                  delivery['Driver Name'] ?? 'N/A',
                ),
                Divider(color: Colors.grey.shade300),
                _buildDetailRow(
                  'Mobile',
                  delivery['Mobile'] ?? 'N/A',
                ),
                Divider(color: Colors.grey.shade300),
                _buildDetailRow(
                  'Pickup Address',
                  delivery['Pickup Address'] ?? 'N/A',
                ),
                Divider(color: Colors.grey.shade300),
                _buildDetailRow(
                  'Delivery Address',
                  delivery['Delivery Address'] ?? 'N/A',
                ),
                Divider(color: Colors.grey.shade300),
                _buildDetailRow(
                  'Delivered Date',
                  delivery['Delivered Date'] ?? 'N/A',
                ),
                Divider(color: Colors.grey.shade300),
                _buildDetailRow(
                  'Delivered ID',
                  delivery['Delivered ID'] ?? 'N/A',
                ),

                const SizedBox(height: 24),

                // Product Details Section
                const Text(
                  'Product details',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  delivery['productDescription'] ?? 'No description available',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
