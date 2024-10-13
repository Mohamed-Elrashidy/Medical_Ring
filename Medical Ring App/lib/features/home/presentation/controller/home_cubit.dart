import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  onInit() async {
    await getUserData();
    if (state is UserDataLoaded) {
      await getHomePageData();
    }
  }

  getUserData() {
    emit(HomeLoading());
  }

  getHomePageData() {
    emit(HomeLoading());
  }
}
