

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/parameters/text_field_parameters.dart';

import '../../../../../core/helpers/validators.dart';
import '../../../../../core/theming/app_locale.dart';



part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(AuthenticationInitial());
  late TextFieldParameters loginEmail;
  late TextFieldParameters loginPassword;


  init() {
    loginEmail = TextFieldParameters(
        hint: AppLocale.enterYourEmail.translate,
        controller: TextEditingController(),
        validator: Validators.validateEmail);
    loginPassword = TextFieldParameters(
      hint: AppLocale.enterYourPassword.translate,
      controller: TextEditingController(),
      isPassword: true,
    );
  }
}
