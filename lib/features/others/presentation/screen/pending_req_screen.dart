import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/dummy_data.dart';
import 'package:flutter_lakshman1020/features/others/presentation/widgets/pending_request_filter.dart';
import 'package:flutter_lakshman1020/features/others/presentation/widgets/pending_request_item.dart';

class PendingReqScreen extends StatelessWidget {
  const PendingReqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            PendingRequestFilter(),
            SizedBox(height: 16),
            Column(
              children: shipments.map((shipment) {
                return PendingRequestItem(shipment: shipment);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
