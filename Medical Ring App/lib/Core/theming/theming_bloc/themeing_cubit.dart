import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../my_app_themes.dart';

part 'themeing_state.dart';

class ThemingCubit extends Cubit<ThemeingState> {
  ThemingCubit() : super(ThemingInitial());
  // Theming
  static ThemeMode currentTheme = ThemeMode.light;

  toggleTheme() {
    currentTheme =
        currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ThemingChanged());
  }

  ThemeData getTheme() {
    if (currentTheme == ThemeMode.light) {
      return MyAppThemes.lightTheme;
    } else {
      return MyAppThemes.darkTheme;
    }
  }

  // localization
  final FlutterLocalization localization = FlutterLocalization.instance;
  void onTranslatedLanguage(Locale? locale) {
    emit(ThemingChanged());
  }

  translate(String key) {
    return localization.translate(key);
  }
}
