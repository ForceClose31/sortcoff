import 'package:bloc/bloc.dart';
import '../../services/home_services.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeServices homeServices;

  HomeBloc(this.homeServices) : super(HomeInitial()) {
    on<FetchHomeData>(_onFetchHomeData);
  }

  Future<void> _onFetchHomeData(FetchHomeData event, Emitter<HomeState> emit) async {
    try {
      final homeData = await homeServices.fetchHomeData(event.userId);
      emit(HomeLoaded(homeData));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
