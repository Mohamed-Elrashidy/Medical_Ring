import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../utils/naviagtion_service.dart';

extension NavigationExtension on BuildContext {
  pop() {
    Navigator.of(this).pop();
  }

  pushNamed(String routeName, {Object? arguments}) {
    print('routeName: $routeName');
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
}

extension TranslationExtension on String {
  String get translate {
    final context = NavigationService.navigatorKey.currentContext;
    if (context != null) {
      return getString(context);
    } else {
      // Provide a fallback translation or handle the null case
      return this; // or return a default translation
    }
  }

  String get capitalizeEachWordFirstLetter {
    return this
        .toLowerCase()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
