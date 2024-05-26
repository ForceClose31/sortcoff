import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomePageState());

  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    if (event is NavigateToHomePage) {
      yield HomePageState();
    } else if (event is NavigateToProfilePage) {
      yield ProfilePageState();
    }
  }
}
