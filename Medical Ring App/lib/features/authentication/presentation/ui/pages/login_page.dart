import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/theming/app_locale.dart';
import 'package:medical_ring_app/core/theming/my_app_colors.dart';
import 'package:medical_ring_app/core/widgets/app_button.dart';
import 'package:medical_ring_app/core/widgets/my_app_text_field.dart';
import 'package:medical_ring_app/core/widgets/vertical_space.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../controller/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  late LoginCubit authenticationCubit;

  @override
  Widget build(BuildContext context) {
    authenticationCubit = BlocProvider.of<LoginCubit>(context);
    authenticationCubit.init();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: AnimationLimiter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 500),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget
                  ),
                ),
                children: [
                  const VerticalSpace(height: 100),
                  Text(
                    AppLocale.welcomeBack.translate,
                    style: MyAppTextStyle.title.copyWith(color: MyAppColors.primary),
                  ),
                  const VerticalSpace(height: 8),
                  Text(
                    AppLocale.welcomeDescription.translate,
                    style: MyAppTextStyle.normalText,
                  ),
                  const VerticalSpace(height: 32),
                  MyAppTextField(parameters: authenticationCubit.loginEmail),
                  const VerticalSpace(height: 16),
                  MyAppTextField(parameters: authenticationCubit.loginPassword),
                  const VerticalSpace(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocale.dontHaveEmail.translate,
                        style: MyAppTextStyle.normalText,
                      ),
                      InkWell(
                        onTap: () {
                          context.pushNamed(Routes.signUpPage);
                        },
                        child: Text(
                          AppLocale.signUp.translate,
                          style: MyAppTextStyle.normalText.copyWith(color: MyAppColors.primary),
                        ),
                      ),
                    ],
                  ),
                  const VerticalSpace(height: 32),
                  AppButton(onTap: () {}, title: AppLocale.signIn.translate),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}