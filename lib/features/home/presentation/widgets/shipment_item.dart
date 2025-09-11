import 'package:flutter/material.dart';

class ShipmentItem extends StatelessWidget {
  const ShipmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.inventory_2, color: Colors.white),
        ),
        title: const Text(
          "#load_45982",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: const Text("Medical equipment for students"),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Chicago, IL", style: TextStyle(fontWeight: FontWeight.w500)),
            Text(
              "Indianapolis, IN",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
