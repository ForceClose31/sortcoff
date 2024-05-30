import 'package:equatable/equatable.dart';
import '../../models/panen_data.dart';

abstract class PanenEvent extends Equatable {
  const PanenEvent();

  @override
  List<Object?> get props => [];
}

class LoadPanenData extends PanenEvent {
  final String userId;

  const LoadPanenData(this.userId);

  @override
  List<Object?> get props => [userId];
}

class AddPanenData extends PanenEvent {
  final String userId;
  final M_Panen panenData;

  const AddPanenData(this.userId, this.panenData);

  @override
  List<Object?> get props => [userId, panenData];
}

class UpdatePanenData extends PanenEvent {
  final String userId;
  final M_Panen panenData;

  const UpdatePanenData(this.userId, this.panenData);

  @override
  List<Object?> get props => [userId, panenData];
}
