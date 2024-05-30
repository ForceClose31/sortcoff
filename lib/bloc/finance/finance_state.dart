import 'package:equatable/equatable.dart';
import '../../models/finance_data.dart';

abstract class FinanceState extends Equatable {
  const FinanceState();

  @override
  List<Object> get props => [];
}

class FinanceLoading extends FinanceState {}

class FinanceLoaded extends FinanceState {
  final List<M_PencatatanKeuangan> financeData;
  final String selectedCategory;

  const FinanceLoaded({
    required this.financeData,
    this.selectedCategory = 'All',
  });

  @override
  List<Object> get props => [financeData, selectedCategory];

  FinanceLoaded copyWith({
    List<M_PencatatanKeuangan>? financeData,
    String? selectedCategory,
  }) {
    return FinanceLoaded(
      financeData: financeData ?? this.financeData,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  List<M_PencatatanKeuangan> get filteredData {
    if (selectedCategory == 'All') {
      return financeData;
    } else {
      return financeData
          .where((data) => data.jenisTransaksi == selectedCategory)
          .toList();
    }
  }
}

class FinanceError extends FinanceState {
  final String message;

  const FinanceError(this.message);

  @override
  List<Object> get props => [message];
}
