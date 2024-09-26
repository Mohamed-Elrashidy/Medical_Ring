import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/authentication/presentation/controller/authentication_cubit.dart';
import '../../features/authentication/presentation/ui/pages/login_page.dart';
import 'routes.dart';

class Routing {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.signInPage):
        {
          return MaterialPageRoute(builder: (context) {
            return BlocProvider(
              create: (context) => AuthenticationCubit(),
              child: LoginPage(),
            );
          });
        }

      default:
        return MaterialPageRoute(builder: (context) {
          return BlocProvider(
            create: (context) => AuthenticationCubit(),
            child: LoginPage(),
          );
        });
    }
  }
}
