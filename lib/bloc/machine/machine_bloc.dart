import 'package:bloc/bloc.dart';
import 'package:sortcoff/services/machine_services.dart';
import 'machine_event.dart';
import 'machine_state.dart';

class MachineBloc extends Bloc<MachineEvent, MachineState> {
  final MachineService _machineServices = MachineService();

  MachineBloc() : super(MachineInitial());

  @override
  // ignore: override_on_non_overriding_member
  Stream<MachineState> mapEventToState(MachineEvent event) async* {
    if (event is SendDataToFirebase) {
      yield* _mapSendDataToFirebaseToState(event);
    }
  }

  Stream<MachineState> _mapSendDataToFirebaseToState(
      SendDataToFirebase event) async* {
    try {
      yield MachineLoading();
      await _sendDataToFirebase(event.value);
      final machineData = await _machineServices
          .getMachineData()
          .first; // Waiting for the first value emitted by the stream
      yield MachineLoaded(machineData);
    } catch (e) {
      yield MachineError('Failed to send data to Firebase: $e');
    }
  }

  Future<void> _sendDataToFirebase(int value) async {
    await _machineServices.sendDataToFirebase(value);
  }
}
