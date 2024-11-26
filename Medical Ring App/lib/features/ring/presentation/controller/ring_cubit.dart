import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ring_state.dart';

class RingCubit extends Cubit<RingState> {
  RingCubit() : super(RingInitial());
}
