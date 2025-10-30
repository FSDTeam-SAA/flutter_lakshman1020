import 'package:flutter/material.dart';

class ActivityController extends ChangeNotifier {
  bool _isLoading = false;
  
  bool get isLoading => _isLoading;

  // Mock data - replace with actual data later
  String userName = 'Michael Ken';
  String userRole = 'Supervisor';
  int checkpoints = 198;
  String period = 'Weekly';

  List<Map<String, String>> activities = List.generate(8, (i) => {
    'id': '#nod_45693',
    'description': 'Medical equipment',
    'status': 'hellopublic.in',
    'location': 'Chicago, IL',
  });

  void loadData() {
    _isLoading = true;
    notifyListeners();

    // Simulate loading
    Future.delayed(Duration(milliseconds: 500), () {
      _isLoading = false;
      notifyListeners();
    });
  }

  void changePeriod() {
    // Handle period change logic
    notifyListeners();
  }
}