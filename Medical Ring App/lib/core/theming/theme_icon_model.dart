import 'package:flutter/material.dart';

import 'theming_bloc/themeing_cubit.dart';

class ThemeIconModel{
  String lightIcon;
  String darkIcon;
  ThemeIconModel({required this.lightIcon, required this.darkIcon});

  String get icon{
    if(ThemingCubit.currentTheme == ThemeMode.light){
      return lightIcon;
    }else{
      return darkIcon;
    }
  }
}