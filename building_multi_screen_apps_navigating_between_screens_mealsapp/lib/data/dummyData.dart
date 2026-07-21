import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/models/GridViewModal.dart';
import 'package:flutter/material.dart';

import '../models/mealsModel.dart';

const categories = [
  Gridviewmodal(id: 'c1', title: 'Italian', color: Colors.red),

  Gridviewmodal(id: 'c2', title: 'Asian', color: Colors.yellow),

  Gridviewmodal(id: 'c3', title: 'Mexican', color: Colors.green),

  Gridviewmodal(id: 'c4', title: 'American', color: Colors.blue),

  Gridviewmodal(id: 'c5', title: 'Indian', color: Colors.deepPurpleAccent),

  Gridviewmodal(id: 'c6', title: 'French', color: Colors.blueAccent),

  Gridviewmodal(id: 'c7', title: 'Chinese', color: Colors.deepOrangeAccent),

  Gridviewmodal(id: 'c8', title: 'Thai', color: Colors.greenAccent),

  Gridviewmodal(id: 'c9', title: 'Healthy', color: Colors.lightGreen),

  Gridviewmodal(id: 'c0', title: 'Quick & Easy', color: Colors.brown),
];
const dummyMeals = [
  Meals(
    id: 'm1',
    categories: const ['c1', 'c2'],
    title: 'Spaghetti Bolognese',
    imageUrl: 'https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9',
    ingredients: const ['Spaghetti', 'Beef', 'Tomato Sauce', 'Onion', 'Garlic'],
    steps: const [
      'Boil spaghetti.',
      'Cook beef.',
      'Add onion and garlic.',
      'Mix tomato sauce.',
      'Serve together.',
    ],
    complex: complexity.simple,
    afford: affordability.affordable,
    duration: 30,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  Meals(
    id: 'm2',
    categories: ['c2'],
    title: 'Grilled Chicken',
    imageUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092',
    ingredients: ['Chicken Breast', 'Olive Oil', 'Salt', 'Pepper'],
    steps: [
      'Season chicken.',
      'Heat grill.',
      'Grill both sides.',
      'Rest for 5 minutes.',
    ],
    complex: complexity.simple,
    afford: affordability.normal,
    duration: 40,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  Meals(
    id: 'm3',
    categories: ['c3'],
    title: 'Veggie Pizza',
    imageUrl: 'https://images.unsplash.com/photo-1513104890138-7c749659a591',
    ingredients: ['Pizza Dough', 'Cheese', 'Capsicum', 'Olives', 'Tomatoes'],
    steps: [
      'Prepare dough.',
      'Spread sauce.',
      'Add toppings.',
      'Bake for 20 minutes.',
    ],
    complex: complexity.hard,
    afford: affordability.normal,
    duration: 50,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meals(
    id: 'm4',
    categories: ['c4'],
    title: 'Vegan Salad',
    imageUrl: 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
    ingredients: ['Lettuce', 'Tomato', 'Cucumber', 'Avocado'],
    steps: [
      'Wash vegetables.',
      'Chop everything.',
      'Mix together.',
      'Serve fresh.',
    ],
    complex: complexity.simple,
    afford: affordability.affordable,
    duration: 15,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meals(
    id: 'm5',
    categories: ['c5'],
    title: 'Beef Burger',
    imageUrl: 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd',
    ingredients: ['Burger Bun', 'Beef Patty', 'Cheese', 'Lettuce'],
    steps: ['Cook patty.', 'Toast bun.', 'Assemble burger.'],
    complex: complexity.simple,
    afford: affordability.normal,
    duration: 25,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),

  Meals(
    id: 'm6',
    categories: ['c1'],
    title: 'Chicken Biryani',
    imageUrl: 'https://images.unsplash.com/photo-1631515243349-e0cb75fb8d3a',
    ingredients: ['Rice', 'Chicken', 'Spices', 'Yogurt'],
    steps: [
      'Cook chicken.',
      'Prepare rice.',
      'Layer together.',
      'Steam for 20 minutes.',
    ],
    complex: complexity.diffcult,
    afford: affordability.high,
    duration: 90,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),

  Meals(
    id: 'm7',
    categories: ['c3', 'c5'],
    title: 'Pancakes',
    imageUrl: 'https://images.unsplash.com/photo-1528207776546-365bb710ee93',
    ingredients: ['Flour', 'Milk', 'Eggs', 'Sugar'],
    steps: ['Mix ingredients.', 'Pour batter.', 'Flip pancake.', 'Serve.'],
    complex: complexity.simple,
    afford: affordability.affordable,
    duration: 20,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),

  Meals(
    id: 'm8',
    categories: ['c2', 'c4'],
    title: 'Fruit Smoothie',
    imageUrl: 'https://images.unsplash.com/photo-1502741338009-cac2772e18bc',
    ingredients: ['Banana', 'Strawberries', 'Mango', 'Almond Milk'],
    steps: ['Add ingredients.', 'Blend well.', 'Serve chilled.'],
    complex: complexity.simple,
    afford: affordability.affordable,
    duration: 10,
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),

  Meals(
    id: 'm9',
    categories: ['c2'],
    title: 'Fish Curry',
    imageUrl: 'https://images.unsplash.com/photo-1559847844-5315695dadae',
    ingredients: ['Fish', 'Coconut Milk', 'Spices'],
    steps: ['Cook spices.', 'Add fish.', 'Pour coconut milk.', 'Simmer.'],
    complex: complexity.hard,
    afford: affordability.high,
    duration: 60,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),

  Meals(
    id: 'm10',
    categories: ['c5'],
    title: 'Chocolate Cake',
    imageUrl: 'https://images.unsplash.com/photo-1578985545062-69928b1d9587',
    ingredients: ['Flour', 'Cocoa Powder', 'Sugar', 'Butter', 'Eggs'],
    steps: ['Mix ingredients.', 'Bake.', 'Cool.', 'Decorate.'],
    complex: complexity.diffcult,
    afford: affordability.normal,
    duration: 75,
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
];
