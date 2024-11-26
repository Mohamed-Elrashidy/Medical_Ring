part of 'ring_cubit.dart';

@immutable
sealed class RingState {}

final class RingInitial extends RingState {}

final class RingLoading extends RingState {}
