import 'package:bloc/bloc.dart';
import '../../models/machine_data.dart';
import '../../services/machine_services.dart';
import 'machine_event.dart';
import 'machine_state.dart';

class VM_Pemilah extends Bloc<MachineEvent, MachineState> {
  final MachineService machineService;

  VM_Pemilah({required this.machineService}) : super(MachineInitial()) {
    on<ActivateMachine>((event, emit) async {
      emit(MachineLoading());
      try {
        await machineService.sendDataToFirebase(event.machineData);
        emit(MachineActivated());
      } catch (e) {
        emit(MachineError(e.toString()));
      }
    });

    on<DeactivateMachine>((event, emit) async {
      emit(MachineLoading());
      try {
        await machineService.sendDataToFirebase(MachineData(on: 0));
        emit(MachineDeactivated());
      } catch (e) {
        emit(MachineError(e.toString()));
      }
    });
  }
}
