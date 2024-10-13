part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class UserDataLoaded extends HomeState {}

final class HomePageDataLoaded extends HomeState {}

final class UserDataFailure extends HomeState{}

final class HomePageDataFailure extends HomeState{}
