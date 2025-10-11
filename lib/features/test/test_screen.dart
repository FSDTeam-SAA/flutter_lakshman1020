import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_bottom_nav.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom Navigation'),
      ),
      body: const Center(
        child: Text('Content goes here'),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          NavItemData(
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            label: 'Home',
            onPressed: () {
              Get.to(() => UserHomeScreen());
            },
          ),
          NavItemData(
            icon: Icons.search,
            label: 'Search',
          ),
          NavItemData(
            icon: Icons.favorite_border,
            selectedIcon: Icons.favorite,
            label: 'Favorites',
          ),
          NavItemData(
            icon: Icons.person_outline,
            selectedIcon: Icons.person,
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// UserHomeScreen definition
class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Home Screen'),
      ),
      body: const Center(
        child: Text('Welcome to your home screen!'),
      ),
    );
  }
}