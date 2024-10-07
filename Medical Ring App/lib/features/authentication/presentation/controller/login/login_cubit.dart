import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_ring_app/core/error_handling/success.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:medical_ring_app/core/parameters/text_field_parameters.dart';

import '../../../../../core/error_handling/Failure.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/theming/app_locale.dart';
import '../../../data/repository/authentication_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  AuthenticationRepository repository = AuthenticationRepository();

  LoginCubit() : super(AuthenticationInitial());
  late TextFieldParameters loginEmail;
  late TextFieldParameters loginPassword;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  Future<void> login() async {
    emit(LoginLoading());

    Either<Failure, Success> result =
        await repository.signInWithEmailAndPassword(
            email: loginEmail.controller.text,
            password: loginPassword.controller.text);

    if (result.isRight()) {
      final UserCredential user = (result as Right).value.returnedData;
      emit(LoginSuccess(user));
      clearTextFields();
    } else {
      final String error = (result as Left).value.errorMessage;
      emit(LoginFailure(error));
    }
  }

  void clearTextFields() {
    loginEmail.controller.clear();
    loginPassword.controller.clear();
  }
}
