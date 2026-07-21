import 'package:expense_tracker_app_riverpod/model/expense_model.dart';

class ExpenseformState {
  final String title;
  final double amount;
  final Category cat;
  final Temperature temp;

  ExpenseformState({
    required this.title,
    required this.amount,
    required this.cat,
    required this.temp,
  });

  ExpenseformState copyWith({
    String? title,
    double? amount,
    Category? cat,
    Temperature? temp,
  }) {
    return ExpenseformState(
      title: title ?? this.title,
      amount: amount ?? this.amount,
      cat: cat ?? this.cat,
      temp: temp ?? this.temp,
    );
  }
}
