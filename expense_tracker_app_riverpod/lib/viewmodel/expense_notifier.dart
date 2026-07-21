import 'package:expense_tracker_app_riverpod/model/expense_model.dart';
import 'package:expense_tracker_app_riverpod/model/expense_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseNotifier extends Notifier<ExpenseState> {
  @override
  ExpenseState build() {
    return ExpenseState(expenses: []);
  }

  void saveExpense(ExpenseModel expense) {
    state = state.copyWith(expenses: [...state.expenses, expense]);
  }

  ExpenseModel whileDismiss(ExpenseModel expense) {
    final updatedExpenses = [...state.expenses];

    updatedExpenses.remove(expense);

    state = state.copyWith(expenses: updatedExpenses);

    return expense;
  }
}
