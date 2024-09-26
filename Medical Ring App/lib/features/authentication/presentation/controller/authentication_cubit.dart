import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/helpers/validators.dart';
import 'package:medical_ring_app/core/parameters/text_field_parameters.dart';
import 'package:medical_ring_app/core/theming/app_locale.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());
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
