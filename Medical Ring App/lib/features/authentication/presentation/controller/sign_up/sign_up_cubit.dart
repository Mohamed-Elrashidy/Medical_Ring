import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:meta/meta.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../../../core/parameters/text_field_parameters.dart';
import '../../../../../core/theming/app_locale.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  late TextFieldParameters signUpEmail;
  late TextFieldParameters signUpPassword;
  late TextFieldParameters signUpConfirmPassword;
  late TextFieldParameters signUpName;
  late TextFieldParameters signUpPhone;

  init() {
    signUpEmail = TextFieldParameters(
        hint: AppLocale.enterYourEmail.translate,
        controller: TextEditingController(),
        validator: Validators.validateEmail);
    signUpPassword = TextFieldParameters(
      hint: AppLocale.enterYourPassword.translate,
      controller: TextEditingController(),
      isPassword: true,
    );
    signUpConfirmPassword = TextFieldParameters(
      hint: AppLocale.confirmPassword.translate,
      controller: TextEditingController(),
      isPassword: true,
    );
    signUpName = TextFieldParameters(
      hint: AppLocale.enterYourName.translate,
      controller: TextEditingController(),
      validator: Validators.validateName,
    );
    signUpPhone = TextFieldParameters(
      hint: AppLocale.enterYourPhone.translate,
      controller: TextEditingController(),
      validator: Validators.validatePhone,
    );
  }




}
