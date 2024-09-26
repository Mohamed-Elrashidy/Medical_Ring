part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoading extends AuthenticationState {}

final class LoginSuccess extends AuthenticationState {}

final class LoginFailure extends AuthenticationState {
  LoginFailure(this.error);
  final String error;
}

