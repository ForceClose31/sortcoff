import 'package:equatable/equatable.dart';

abstract class MachineEvent extends Equatable {
  const MachineEvent();

  @override
  List<Object> get props => [];
}

class SendDataToFirebase extends MachineEvent {
  final int value;

  const SendDataToFirebase(this.value);

  @override
  List<Object> get props => [value];
}
