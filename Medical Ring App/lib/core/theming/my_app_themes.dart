import 'package:flutter/material.dart';

import 'my_app_colors.dart';
import 'theme_colors.dart';

class MyAppThemes {
  static final lightTheme = ThemeData(
    primaryColor: MyAppColors.primary,
    brightness: Brightness.light,
    scaffoldBackgroundColor: ThemeColors.scaffoldBackGroundColor.lightColor,
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    primaryColor: MyAppColors.primary,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ThemeColors.scaffoldBackGroundColor.darkColor,
    useMaterial3: true,
  );
}
