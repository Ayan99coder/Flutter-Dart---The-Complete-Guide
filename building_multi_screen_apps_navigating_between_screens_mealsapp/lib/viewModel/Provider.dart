import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/data/dummyData.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/models/mealsModel.dart';
import 'package:flutter/material.dart';

class MealProvider extends ChangeNotifier {

  final List<Meals> _allMeals = dummyMeals;
  List<Meals> _filterList = [];

  String? _selectedCategory;

  int _selectedIndex = 0;
  final List<Meals> favouriteMeal = [];

  bool _glutenFree = false;

  bool _lactoseFree = false;

  bool _vegetarian = false;

  bool _vegan = false;

  List<Meals> get meals => _filterList;

  int get selectedIndex => _selectedIndex;

  bool get glutenFree => _glutenFree;

  bool get lactoseFree => _lactoseFree;

  bool get vegetarian => _vegetarian;

  bool get vegan => _vegan;

  void changePage(int index) {
    _selectedIndex = index;

    notifyListeners();
  }

  void loadMeals(String catId) {
    _selectedCategory = catId;

    applyFilter();
  }

  void changeFilter(String filterName, bool value) {
    switch (filterName) {
      case "gluten":
        _glutenFree = value;

        break;

      case "lactose":
        _lactoseFree = value;

        break;

      case "vegetarian":
        _vegetarian = value;

        break;

      case "vegan":
        _vegan = value;

        break;
    }

    applyFilter();
  }

  void applyFilter() {
    _filterList = _allMeals.where((meal) {
      if (_selectedCategory != null &&
          !meal.categories.contains(_selectedCategory)) {
        return false;
      }

      if (_glutenFree && !meal.isGlutenFree) {
        return false;
      }

      if (_lactoseFree && !meal.isLactoseFree) {
        return false;
      }
      if (_vegetarian && !meal.isVegetarian) {
        return false;
      }
      if (_vegan && !meal.isVegan) {
        return false;
      }

      return true;
    }).toList();

    notifyListeners();
  }

  String toggleFavourite(Meals meal) {
    if (favouriteMeal.contains(meal)) {
      favouriteMeal.remove(meal);

      notifyListeners();

      return "${meal.title} removed from favourites";
    } else {
      favouriteMeal.add(meal);

      notifyListeners();

      return "${meal.title} added to favourites";
    }
  }

  bool isFavourites(Meals meal) {
    return favouriteMeal.contains(meal);
  }
}
