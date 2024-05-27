import 'package:equatable/equatable.dart';
import 'package:sortcoff/models/machine_data.dart';

abstract class MachineState extends Equatable {
  const MachineState();

  @override
  List<Object> get props => [];
}

class MachineInitial extends MachineState {}

class MachineLoading extends MachineState {}

class MachineLoaded extends MachineState {
  final MachineData machineData;

  const MachineLoaded(this.machineData);

  @override
  List<Object> get props => [machineData];
}

class MachineError extends MachineState {
  final String message;

  const MachineError(this.message);

  @override
  List<Object> get props => [message];
}
