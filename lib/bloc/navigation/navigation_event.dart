import 'package:equatable/equatable.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigateToHomePage extends NavigationEvent {}

class NavigateToProfilePage extends NavigationEvent {}

class NavigateToPanenPage extends NavigationEvent {}
