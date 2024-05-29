// lib/bloc/machine_state.dart

import 'package:equatable/equatable.dart';

abstract class MachineState extends Equatable {
  const MachineState();

  @override
  List<Object> get props => [];
}

class MachineInitial extends MachineState {}

class MachineLoading extends MachineState {}

class MachineActivated extends MachineState {}

class MachineDeactivated extends MachineState {}

class MachineError extends MachineState {
  final String message;

  const MachineError(this.message);

  @override
  List<Object> get props => [message];
}
