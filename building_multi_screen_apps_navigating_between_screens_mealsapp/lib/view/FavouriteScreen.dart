import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewModel/Provider.dart';
import 'MealsDetailScreen.dart';

class Favouritescreen extends StatelessWidget {
  const Favouritescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MealProvider>();
    final favouriteMeals = provider.favouriteMeal;

    return favouriteMeals.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 90,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                SizedBox(height: 20),
                Text(
                  "No Favourite Meals Yet",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Tap the heart icon to add meals.",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ],
            ),
          )
        : ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: favouriteMeals.length,
            itemBuilder: (context, index) {
              final meal = favouriteMeals[index];

              return Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8),
                clipBehavior: Clip.antiAlias,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealsDetail(data: meal),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        meal.imageUrl,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meal.title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                const Icon(Icons.schedule),
                                const SizedBox(width: 5),
                                Text("${meal.duration} min"),

                                const Spacer(),

                                const Icon(Icons.restaurant_menu),
                                const SizedBox(width: 5),
                                Text(
                                  meal.complex.name[0].toUpperCase() +
                                      meal.complex.name.substring(1),
                                ),

                                const Spacer(),

                                IconButton(
                                  onPressed: () {
                                    final content = provider.toggleFavourite(
                                      meal,
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(content)),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
