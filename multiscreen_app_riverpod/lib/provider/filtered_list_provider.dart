import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app_riverpod/model/meals_model.dart';
import 'package:multiscreen_app_riverpod/provider/meals_screen_provider.dart';


final catFilterList =
Provider.family<List<MealsModel>, String>((ref, categoryId) {
  final meals = ref.watch(mealsProvider);

  return meals.where((meal) {
    return meal.categoryIds.contains(categoryId);
  }).toList();
});
