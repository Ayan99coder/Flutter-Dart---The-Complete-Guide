import 'package:expense_tracker_app_riverpod/model/expenseform_state.dart';
import 'package:expense_tracker_app_riverpod/viewmodel/expenseform_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseFormProvider =
    NotifierProvider<ExpenseformNotifier, ExpenseformState>(
      ExpenseformNotifier.new,
    );
