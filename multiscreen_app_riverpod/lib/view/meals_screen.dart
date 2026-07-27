import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app_riverpod/provider/favourtiemealProvider.dart';
import 'package:multiscreen_app_riverpod/provider/filtered_list_provider.dart';
import 'package:multiscreen_app_riverpod/view/mealsDetail_screen.dart';

class MealsScreen extends ConsumerWidget {
  const MealsScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = ref.watch(catFilterList(id));
    return Scaffold(
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (_, i) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MealsdetailScreen(meal: meals[i]),
                ),
              );
            },
            child: ListTile(
              title: Text(meals[i].title),
              trailing: IconButton(
                onPressed: () {
                  ref
                      .read(favMealProvider.notifier)
                      .toggleFavouriteList(meals[i]);
                },
                icon: Icon(
                  ref.watch(favMealProvider.notifier).isFavourite(meals[i])
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
