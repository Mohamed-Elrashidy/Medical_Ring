import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:medical_ring_app/Core/helpers/extension.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_locale.dart';
import '../../../../../core/theming/my_app_colors.dart';
import '../../../../../core/theming/text_styles.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/loading_widget.dart';
import '../../../../../core/widgets/my_app_text_field.dart';
import '../../../../../core/widgets/vertical_space.dart';
import '../../controller/login/login_cubit.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  late LoginCubit cubit;

  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<LoginCubit>(context);
    cubit.init(); // Initialize the TextField parameters

    return Scaffold(
      body: SafeArea(child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          if (state is LoginLoading) {
            return Stack(
              children: [_BuildSignInForm(), const LoadingWidget()],
            );
          } else {
            return _BuildSignInForm();
          }
        },
      )),
    );
  }
}

class _BuildSignInForm extends StatelessWidget {
  _BuildSignInForm({super.key});
  late LoginCubit cubit;
  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<LoginCubit>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AnimationLimiter(
        child: Form(
          key: cubit.formKey, // Use this formKey for validation
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 500),
              childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 50.0, child: FadeInAnimation(child: widget)),
              children: [
                const VerticalSpace(height: 100),
                Text(
                  AppLocale.welcomeBack.getString(context),
                  style:
                      MyAppTextStyle.title.copyWith(color: MyAppColors.primary),
                ),
                const VerticalSpace(height: 8),
                Text(AppLocale.welcomeDescription.getString(context),
                    style: MyAppTextStyle.normalText),
                const VerticalSpace(height: 32),
                MyAppTextField(parameters: cubit.loginEmail),
                const VerticalSpace(height: 16),
                MyAppTextField(parameters: cubit.loginPassword),
                const VerticalSpace(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppLocale.dontHaveEmail.getString(context),
                        style: MyAppTextStyle.normalText),
                    InkWell(
                      onTap: () {
                        context.pushNamed(Routes.signUpPage);
                      },
                      child: Text(AppLocale.signUp.getString(context),
                          style: MyAppTextStyle.normalText
                              .copyWith(color: MyAppColors.primary)),
                    ),
                  ],
                ),
                const VerticalSpace(height: 32),
                AppButton(
                    onTap: () {
                      if (cubit.formKey.currentState!.validate()) {
                        // Trigger form validation
                        cubit.login(); // Proceed if validation is successful
                      }
                    },
                    title: AppLocale.signIn.getString(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
