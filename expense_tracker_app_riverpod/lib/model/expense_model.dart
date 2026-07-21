import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ExpenseModel {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final Temperature temperature;

  ExpenseModel({
    required this.temperature,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }): id = Uuid().v4();
}

enum Category {
  food,
  travel,
  shopping,
  entertainment,
  bills,
  health,
  education,
  other,
}

enum Temperature { high, medium, low }

const iconSelection = {
  Category.food: Icons.food_bank_outlined,
  Category.travel: Icons.directions_car,
  Category.shopping: Icons.shopping_bag,
  Category.entertainment: Icons.movie,
  Category.bills: Icons.receipt_long,
  Category.health: Icons.local_hospital,
  Category.education: Icons.school,
  Category.other: Icons.category,
};
const temperatureColors = {
  Temperature.high: Colors.red,
  Temperature.medium: Colors.orange,
  Temperature.low: Colors.blue,
};
