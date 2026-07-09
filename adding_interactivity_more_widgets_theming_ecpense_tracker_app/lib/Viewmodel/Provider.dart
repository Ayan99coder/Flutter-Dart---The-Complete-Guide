import 'package:adding_interactivity_more_widgets_theming_ecpense_tracker_app/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> expenseList = [];
  List<ExpenseBucket> expenseBuckets = [];
  String titleValue = "";
  String descriptionValue = "";
  final numberController = TextEditingController();
  DateTime? selectedDate;
  Category _selectedCategory = Category.food;

  Category get selectedCategory => _selectedCategory;

  set selectedCategory(Category value) {
    _selectedCategory = value;
    notifyListeners(); // 🔥 MUST
  }

  void expenseBucket() {
    final save = ExpenseBucket(
      category: _selectedCategory,
      expense: expenseList,
    );
    expenseBuckets.add(save);
    notifyListeners();
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
  }

  String? validation() {
    if (titleValue.trim().isEmpty) {
      return "Title is required";
    }

    if (descriptionValue.trim().isEmpty) {
      return "Description is required";
    }

    if (numberController.text.trim().isEmpty) {
      return "Amount is required";
    }

    if (double.tryParse(numberController.text.trim()) == null) {
      return "Amount must be a valid number";
    }

    if (selectedDate == null) {
      return "Please select a date";
    }

    return null;
  }

  Future<void> saveTask() async {
    final save = Expense(
      title: titleValue,
      category: _selectedCategory,
      // 🔥 FIX HERE
      charges: double.parse(numberController.text),
      date: selectedDate!,
      description: descriptionValue,
    );

    expenseList.add(save);
    expenseBucket();
    notifyListeners();
  }

  void removeExpense(Expense expense) {
    expenseList.remove(expense);
    notifyListeners();
  }

  void insertExpense(int index, Expense expense) {
    expenseList.insert(index, expense);
    notifyListeners();
  }
}
