part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class AuthenticationInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginFailure extends LoginState {
  LoginFailure(this.error);
  final String error;
}

