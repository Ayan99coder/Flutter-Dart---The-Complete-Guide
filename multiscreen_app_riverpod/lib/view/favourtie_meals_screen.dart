import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app_riverpod/provider/favourtiemealProvider.dart';

class FavourtieMealsScreen extends ConsumerWidget {
  const FavourtieMealsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ListView.builder(
        itemCount: ref.watch(favMealProvider).length,
        itemBuilder: (_, i) {
          final data = ref.watch(favMealProvider)[i];
          return ListTile(
            title: Text(data.title),
            trailing: IconButton(
              onPressed: () {
                ref.read(favMealProvider.notifier).toggleFavouriteList(data);
              },
              icon: Icon(
                ref.watch(favMealProvider.notifier).isFavourite(data)
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),
            ),
          );
        },
      ),
    );
  }
}
