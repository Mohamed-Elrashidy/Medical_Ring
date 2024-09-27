import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_ring_app/core/routing/routes.dart';
import 'package:medical_ring_app/features/authentication/presentation/ui/pages/signup_page.dart';

import '../../features/authentication/presentation/controller/authentication_cubit.dart';
import '../../features/authentication/presentation/ui/pages/login_page.dart';

class Routing {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (Routes.signInPage):
        {
         return MaterialPageRoute(
              builder: (_) =>  BlocProvider(
                create: (_) => AuthenticationCubit(),
                child: LoginPage(),
              ),);
        }
        case (Routes.signUpPage):
        {
         return MaterialPageRoute(
              builder: (_) =>  BlocProvider(
                create: (_) => AuthenticationCubit(),
                child: SignupPage(),
              ),);
        }
      default:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (_) => AuthenticationCubit(),
                child:  LoginPage()));
    }
  }
}
