import 'package:expense_tracker_app_riverpod/model/expense_state.dart';
import 'package:expense_tracker_app_riverpod/viewmodel/expense_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseProvider = NotifierProvider<ExpenseNotifier, ExpenseState>(
  ExpenseNotifier.new,
);
