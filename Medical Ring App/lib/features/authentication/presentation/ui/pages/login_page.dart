import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/theming/app_locale.dart';
import 'package:medical_ring_app/core/theming/my_app_colors.dart';
import 'package:medical_ring_app/core/widgets/app_button.dart';
import 'package:medical_ring_app/core/widgets/my_app_text_field.dart';
import 'package:medical_ring_app/core/widgets/vertical_space.dart';
import 'package:medical_ring_app/features/authentication/presentation/controller/authentication_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  late AuthenticationCubit authenticationCubit;
  @override
  Widget build(BuildContext context) {
    authenticationCubit = BlocProvider.of<AuthenticationCubit>(context);
    authenticationCubit.init();
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(height: 100),
/*          Text(AppLocale.welcomeBack.translate,
              style: MyAppTextStyle.title.copyWith(color: MyAppColors.primary)),
          const VerticalSpace(height: 8),
          Text(AppLocale.welcomeDescription.translate,
              style: MyAppTextStyle.normalText),*/
          MyAppTextField(parameters: authenticationCubit.loginEmail),
          const VerticalSpace(height: 16),
          MyAppTextField(parameters: authenticationCubit.loginPassword),
          const VerticalSpace(height: 16),
          const VerticalSpace(height: 32),
          AppButton(onTap: () {}, title: AppLocale.signIn.translate)
        ],
      ),
    )));
  }
}
