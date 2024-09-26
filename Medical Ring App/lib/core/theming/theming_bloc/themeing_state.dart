part of 'themeing_cubit.dart';

@immutable
sealed class ThemeingState {}

final class ThemingInitial extends ThemeingState {}

final class ThemingChanged extends ThemeingState {}
