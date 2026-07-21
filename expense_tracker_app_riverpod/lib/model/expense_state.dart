import 'expense_model.dart';

class ExpenseState {
  final List<ExpenseModel> expenses;
  final bool isLoading;
  final String? error;

  const ExpenseState({
    required this.expenses,
    this.isLoading = false,
    this.error,
  });

  ExpenseState copyWith({
    List<ExpenseModel>? expenses,
    bool? isLoading,
    String? error,
  }) {
    return ExpenseState(
      expenses: expenses ?? this.expenses,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}