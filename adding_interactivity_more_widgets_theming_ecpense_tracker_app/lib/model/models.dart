import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import '../data/data.dart';

final formatter = DateFormat.yMd();

class Expense {
  final String id;
  final String title;
  final String description;
  final double charges;
  final DateTime date;
  final Category category;

  Expense({
    required this.title,
    required this.category,
    required this.date,
    required this.description,
    required this.charges,
  }) : id = Uuid().v4();

  String get formatedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  final Category category;
  final List<Expense> expense;

  ExpenseBucket({required this.category, required this.expense});

  ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
    : expense = allExpense
          .where((expense) => expense.category == category)
          .toList();

  double get totalExpenses {
    double sum = 0;
    for (final expenses in expense) {
      sum += expenses.charges;
    }
    return sum;
  }
}
