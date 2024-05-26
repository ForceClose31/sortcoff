import 'package:flutter_bloc/flutter_bloc.dart';
import 'finance_event.dart';
import 'finance_state.dart';
import '../../services/finance_services.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  final FinanceService financeService;

  FinanceBloc({required this.financeService}) : super(FinanceLoading()) {
    on<LoadFinanceData>(_onLoadFinanceData);
    on<AddFinanceData>(_onAddFinanceData);
    on<UpdateCategory>(_onUpdateCategory);
    on<UpdateFinanceData>(_onUpdateFinanceData);
  }

  Future<void> _onLoadFinanceData(
      LoadFinanceData event, Emitter<FinanceState> emit) async {
    try {
      final userId = event.userId;
      final financeList = await financeService.fetchFinanceData(userId);
      emit(FinanceLoaded(financeData: financeList));
    } catch (e) {
      emit(FinanceError(e.toString()));
    }
  }

  Future<void> _onAddFinanceData(
      AddFinanceData event, Emitter<FinanceState> emit) async {
    try {
      final userId = event.userId;
      await financeService.addFinanceData(userId, event.financeData);
      final financeList = await financeService.fetchFinanceData(userId);
      emit(FinanceLoaded(financeData: financeList));
    } catch (e) {
      emit(FinanceError(e.toString()));
    }
  }

  void _onUpdateCategory(UpdateCategory event, Emitter<FinanceState> emit) {
    final currentState = state as FinanceLoaded;
    emit(currentState.copyWith(selectedCategory: event.category));
  }
  
  Future<void> _onUpdateFinanceData(
      UpdateFinanceData event, Emitter<FinanceState> emit) async {
    if (state is FinanceLoaded) {
      final currentState = state as FinanceLoaded;
      try {
        final userId = event.userId;
        await financeService.updateFinanceData(
            userId, event.updatedFinanceData);
        final financeList = await financeService.fetchFinanceData(userId);
        emit(currentState.copyWith(financeData: financeList));
      } catch (e) {
        emit(FinanceError(e.toString()));
      }
    }
  }
}
