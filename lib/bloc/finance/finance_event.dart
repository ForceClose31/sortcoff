import 'package:equatable/equatable.dart';
import '../../models/finance_data.dart';

abstract class FinanceEvent extends Equatable {
  const FinanceEvent();

  @override
  List<Object> get props => [];
}

class LoadFinanceData extends FinanceEvent {
  final String userId;

  const LoadFinanceData(this.userId);

  @override
  List<Object> get props => [userId];
}

class AddFinanceData extends FinanceEvent {
  final String userId;
  final FinanceData financeData;

  const AddFinanceData(this.userId, this.financeData);

  @override
  List<Object> get props => [userId, financeData];
}

class UpdateCategory extends FinanceEvent {
  final String category;

  const UpdateCategory(this.category);

  @override
  List<Object> get props => [category];
}

class UpdateFinanceData extends FinanceEvent {
  final String userId;
  final FinanceData updatedFinanceData;

  const UpdateFinanceData(this.userId, this.updatedFinanceData);
}

