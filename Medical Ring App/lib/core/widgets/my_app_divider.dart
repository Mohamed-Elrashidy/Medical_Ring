import 'package:flutter/material.dart';

import '../theming/my_app_colors.dart';

class MyAppDivider extends StatelessWidget {
  const MyAppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: MyAppColors.greyLight,
    );
  }
}
