import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:medical_ring_app/core/theming/app_locale.dart';
import 'package:medical_ring_app/core/widgets/app_button.dart';
import 'package:medical_ring_app/core/widgets/loading_widget.dart';
import 'package:medical_ring_app/core/widgets/my_app_app_bar.dart';
import 'package:medical_ring_app/core/widgets/my_app_text_field.dart';
import 'package:medical_ring_app/core/widgets/vertical_space.dart';
import 'package:medical_ring_app/features/authentication/presentation/controller/sign_up/sign_up_cubit.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  late SignUpCubit signUpCubit;
  @override
  Widget build(BuildContext context) {
    signUpCubit = BlocProvider.of<SignUpCubit>(context);
    signUpCubit.init();
    return Scaffold(
      body: SafeArea(child:
          BlocBuilder<SignUpCubit, SignUpState>(builder: (context, state) {
        if (state is SignUpLoading) {
          return Stack(
            children: [_buildSignUpForm(context), const LoadingWidget()],
          );
        } else if (state is SignUpSuccess) {
          return _buildSignUpForm(context);
        } else {
          return _buildSignUpForm(context);
        }
      })),
    );
  }

  Widget _buildSignUpForm(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Form(
            key: signUpCubit.formKey,
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 500),
                  childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(child: widget)),
                  children: [
                    MyAppAppBar(
                        title: AppLocale.signUpPageTitle.getString(context)),
                    const VerticalSpace(height: 100),
                    MyAppTextField(parameters: signUpCubit.signUpName),
                    const VerticalSpace(height: 16),
                    MyAppTextField(parameters: signUpCubit.signUpEmail),
                    const VerticalSpace(height: 16),
                    MyAppTextField(parameters: signUpCubit.signUpPassword),
                    const VerticalSpace(height: 16),
                    MyAppTextField(
                        parameters: signUpCubit.signUpConfirmPassword),
                    const VerticalSpace(height: 24),
                    AppButton(
                      onTap: () {
                        if (signUpCubit.formKey.currentState!.validate()) {
                          signUpCubit.signUpWithEmailAndPassword();
                        }
                      },
                      title: AppLocale.signUp.getString(context),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
