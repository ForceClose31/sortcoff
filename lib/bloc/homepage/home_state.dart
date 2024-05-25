import 'package:equatable/equatable.dart';
import '../../models/home_data.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<HomeData> homeDataList;

  const HomeLoaded(this.homeDataList);

  @override
  List<Object> get props => [homeDataList];
}

class HomeError extends HomeState {
  final String error;

  const HomeError(this.error);

  @override
  List<Object> get props => [error];
}
