import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/constants/app_colors.dart';

class CompanyDrawer extends StatelessWidget {
  const CompanyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: TColors.white),
            child: Row(
              children: [
                Image(image: AssetImage("assets/images/spark_icon.png")),
                const SizedBox(width: 4),
                Text(
                  "Spark Delivery",
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Image(
              height: 18,
              width: 18,
              image: AssetImage("assets/images/dashboard_icon.png"),
            ),
            title: Text("Dashboard", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image(
              height: 18,
              width: 18,
              image: AssetImage("assets/images/running_load_icon.png"),
            ),
            title: Text("Running load", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image(
              height: 18,
              width: 18,
              image: AssetImage("assets/images/running_load_icon.png"),
            ),
            title: Text(
              "Pneding Request",
              style: TextStyle(color: TColors.grey),
            ),
            onTap: () {},
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/driver_icon.png"),
              height: 18,
              width: 18,
            ),
            title: Text("Driver", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/dispatcher_icon.png"),
              height: 18,
              width: 18,
            ),
            title: Text("Dispatcher", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/message_icon.png"),
              height: 18,
              width: 18,
            ),
            title: Text("Message", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/subscription_icon.png"),
              height: 18,
              width: 18,
            ),
            title: Text("Subscription", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Image(
              image: AssetImage("assets/images/dispatcher_icon.png"),
              height: 18,
              width: 18,
            ),
            title: Text("Settings", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          Spacer(),

          ListTile(
            tileColor: Color(0xFFF2E9E8),
            leading: Image(
              image: AssetImage("assets/images/logout_icon.png"),
              height: 24,
              width: 24,
            ),
            title: Text("Log out", style: TextStyle(color: TColors.grey)),
            onTap: () {},
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
