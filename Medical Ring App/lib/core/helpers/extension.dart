import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../routing/routing.dart';
import '../utils/naviagtion_service.dart';

extension NavigationExtension on BuildContext {
  pop() {
    Navigator.of(this).pop();
  }
  pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
/*
  persistentPushScreen(String routeName) {
    // I am using onGenerate route and need have routename I need to navigate with navbar
    Route<dynamic> route =
        Routing.onGenerateRoute(RouteSettings(name: routeName));
    PersistentNavBarNavigator.pushDynamicScreen(this,
        screen: route, withNavBar: true);
  }*/
}

extension TranslationExtension on String {
  String get translate =>
      this.getString(NavigationService.navigatorKey.currentContext!);

  String get capitalizeEachWordFirstLetter {
    return this
        .toLowerCase()
        .split(' ')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }
}
