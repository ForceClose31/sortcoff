import 'package:bloc/bloc.dart';
import 'panen_event.dart';
import 'panen_state.dart';
import '../../services/panen_services.dart';

class PanenBloc extends Bloc<PanenEvent, PanenState> {
  final PanenService panenService;

  PanenBloc({required this.panenService}) : super(PanenLoading()) {
    on<LoadPanenData>(_onLoadPanenData);
    on<AddPanenData>(_onAddPanenData);
    on<UpdatePanenData>(_onUpdatePanenData);
  }

  Future<void> _onLoadPanenData(LoadPanenData event, Emitter<PanenState> emit) async {
    try {
      final userId = event.userId;
      final panenList = await panenService.fetchPanenData(userId);
      emit(PanenLoaded(panenList));
    } catch (e) {
      emit(PanenError(e.toString()));
    }
  }

  Future<void> _onAddPanenData(AddPanenData event, Emitter<PanenState> emit) async {
    try {
      final userId = event.userId; 
      await panenService.addPanenData(userId, event.panenData);
      final panenList = await panenService.fetchPanenData(userId);
      emit(PanenLoaded(panenList));
    } catch (e) {
      emit(PanenError(e.toString()));
    }
  }

  Future<void> _onUpdatePanenData(UpdatePanenData event, Emitter<PanenState> emit) async {
    try {
      final userId = event.userId; 
      await panenService.updatePanenData(userId, event.panenData.id, event.panenData);
      final panenList = await panenService.fetchPanenData(userId);
      emit(PanenLoaded(panenList));
    } catch (e) {
      emit(PanenError(e.toString()));
    }
  }
}
