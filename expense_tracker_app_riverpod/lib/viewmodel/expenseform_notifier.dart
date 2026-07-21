import 'dart:math';

import 'package:expense_tracker_app_riverpod/model/expense_model.dart';
import 'package:expense_tracker_app_riverpod/model/expenseform_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExpenseformNotifier extends Notifier<ExpenseformState> {
  @override
  ExpenseformState build() {
    return ExpenseformState(
      title: "",
      amount: 0,
      cat: Category.food,
      temp: Temperature.medium,
    );
  }

  void setTitle(String value) {
    state = state.copyWith(title: value);
  }

  void setAmount(double num) {
    state = state.copyWith(amount: num);
  }
  void setCategory(Category cat){
    state = state.copyWith(cat: cat);
  }
  void setTemperature(Temperature temp){
    state = state.copyWith(temp:temp );
  }

String? validation(){
    if(state.title.isEmpty) return "Please fill the title of expense";
    if(state.amount <= 0) return "Please fill the valid amount";
    return null;
}
  void reset() {
    state = ExpenseformState(
      title: "",
      amount: 0,
      cat: Category.food,
      temp: Temperature.medium,
    );
  }
}
