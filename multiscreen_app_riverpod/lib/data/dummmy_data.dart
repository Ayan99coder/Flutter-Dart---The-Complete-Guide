import 'package:multiscreen_app_riverpod/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:multiscreen_app_riverpod/model/meals_model.dart';

const List<CategoriesModel> categories = [
  CategoriesModel(id: "C1", title: "Italian", color: Colors.red),
  CategoriesModel(id: "C2", title: "Quick & Easy", color: Colors.orange),
  CategoriesModel(id: "C3", title: "Hamburgers", color: Colors.amber),
  CategoriesModel(id: "C4", title: "German", color: Colors.blue),
  CategoriesModel(id: "C5", title: "Light & Lovely", color: Colors.green),
  CategoriesModel(id: "C6", title: "Exotic", color: Colors.purple),
  CategoriesModel(id: "C7", title: "Breakfast", color: Colors.teal),
  CategoriesModel(id: "C8", title: "Asian", color: Colors.indigo),
  CategoriesModel(id: "C9", title: "French", color: Colors.pink),
  CategoriesModel(id: "C10", title: "Summer", color: Colors.cyan),
];
const List<MealsModel> meals = [
  MealsModel(
    id: "M11",
    categoryIds: ["C1", "C2"],
    title: "Cheesy Pizza",
    imageUrl: "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    duration: 35,
    complexity: Complexity.simple,
    affordability: Affordability.affordable,

    ingredients: [
      "Pizza Dough",
      "Pizza Sauce",
      "Mozzarella Cheese",
      "Cheddar Cheese",
      "Olives",
      "Capsicum",
      "Onion",
      "Oregano",
      "Chili Flakes",
    ],

    steps: [
      "Preheat oven to 220°C.",
      "Roll the pizza dough.",
      "Spread pizza sauce evenly.",
      "Add mozzarella and cheddar cheese.",
      "Top with vegetables.",
      "Sprinkle oregano and chili flakes.",
      "Bake for 20 minutes.",
      "Slice and serve hot.",
    ],

    isGlutenFree: false,
    isLactoseFree: false,
    isVegetarian: true,
    isVegan: false,
  ),
];
