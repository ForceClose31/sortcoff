import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class FetchHomeData extends HomeEvent {
  final String userId;

  const FetchHomeData(this.userId);

  @override
  List<Object> get props => [userId];
}
