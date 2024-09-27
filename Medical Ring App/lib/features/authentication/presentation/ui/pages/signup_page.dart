import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_ring_app/Core/helpers/extension.dart';
import 'package:medical_ring_app/core/theming/app_locale.dart';
import 'package:medical_ring_app/core/widgets/my_app_app_bar.dart';
import 'package:medical_ring_app/features/authentication/presentation/controller/authentication_cubit.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  late AuthenticationCubit authenticationCubit;
  @override
  Widget build(BuildContext context) {
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              MyAppAppBar(title: AppLocale.signUp.getString(context))
            ],
          ),
        ),
      ),

    );
  }
}
