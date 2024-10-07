import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_ring_app/core/error_handling/success.dart';
import 'package:medical_ring_app/core/helpers/extension.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error_handling/Failure.dart';
import '../../../../../core/helpers/validators.dart';
import '../../../../../core/parameters/text_field_parameters.dart';
import '../../../../../core/theming/app_locale.dart';
import '../../../data/repository/authentication_repository.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  AuthenticationRepository repository = AuthenticationRepository();
  SignUpCubit() : super(SignUpInitial());
  late TextFieldParameters signUpEmail;
  late TextFieldParameters signUpPassword;
  late TextFieldParameters signUpConfirmPassword;
  late TextFieldParameters signUpName;
  late TextFieldParameters signUpPhone;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  init() {
    /*******************  TEXT FIELD PARAMETERS  *******************/
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

  /************************** FUNCTION TO SIGN UP **************************/

  signUpWithEmailAndPassword() async {
    emit(SignUpLoading());
    Either<Failure, Success> result =
        await repository.signUpWithEmailAndPassword(
      email: signUpEmail.controller.text,
      password: signUpPassword.controller.text,
    );
    if (result.isRight()) {
      final user =
          result.getOrElse(() => Success()).returnedData as UserCredential;
      emit(SignUpSuccess(user));
      clearTextFields();
    } else {
      emit(SignUpFailure(result.fold((l) => l.errorMessage, (r) => '')));
    }
  }

  /************************** FUNCTION TO CLEAR TEXT FIELDS **************************/
  clearTextFields(){
    signUpEmail.controller.clear();
    signUpPassword.controller.clear();
    signUpConfirmPassword.controller.clear();
    signUpName.controller.clear();
    signUpPhone.controller.clear();
  }

}
