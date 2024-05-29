// lib/bloc/machine_event.dart

import 'package:equatable/equatable.dart';
import '../../models/machine_data.dart';

abstract class MachineEvent extends Equatable {
  const MachineEvent();

  @override
  List<Object> get props => [];
}

class ActivateMachine extends MachineEvent {
  final MachineData machineData;

  const ActivateMachine(this.machineData);

  @override
  List<Object> get props => [machineData];
}

class DeactivateMachine extends MachineEvent {}
