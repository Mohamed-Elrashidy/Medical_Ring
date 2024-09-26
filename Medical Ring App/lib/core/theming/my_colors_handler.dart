import 'package:flutter/material.dart';

import 'theming_bloc/themeing_cubit.dart';

class MyColorsHandler {
  Color lightColor;
  Color darkColor;
  MyColorsHandler({required this.lightColor, required this.darkColor});
  Color get color {
    return ThemingCubit.currentTheme == ThemeMode.light
        ? lightColor
        : darkColor;
  }
}
