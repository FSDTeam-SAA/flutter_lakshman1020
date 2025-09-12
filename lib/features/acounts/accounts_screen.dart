import 'package:flutter/material.dart';
import 'package:flutter_lakshman1020/core/widgets/app_scaffold.dart';

import '../../core/constants/app_colors.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(color: TColors.primary),
            height: 428,
            child: Text('data'),
          )
        ],
      )
    ),
    );
  }
}
