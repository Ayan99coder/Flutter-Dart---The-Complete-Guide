enum affordability { affordable, high, normal }

enum complexity { simple, hard, diffcult }

class Meals {
  final String id;
  final int duration;
  final complexity complex;
  final affordability afford;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;

 const Meals({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.complex,
    required this.afford,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    required this.duration,
  });
}
