import 'package:equatable/equatable.dart';
import '../../models/panen_data.dart';

abstract class PanenState extends Equatable {
  const PanenState();

  @override
  List<Object> get props => [];
}

class PanenLoading extends PanenState {}

class PanenLoaded extends PanenState {
  final List<PanenData> panenList;

  const PanenLoaded(this.panenList);

  @override
  List<Object> get props => [panenList];
}

class PanenError extends PanenState {
  final String message;

  const PanenError(this.message);

  @override
  List<Object> get props => [message];
}
