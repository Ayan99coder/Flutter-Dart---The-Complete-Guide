import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:multiscreen_app_riverpod/provider/categories_list_provider.dart';
import 'package:multiscreen_app_riverpod/view/meals_screen.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final data in ref.watch(categoriesProvider))
          InkWell(
            splashColor: Theme.of(context).colorScheme.onSurface,
            borderRadius: .circular(23),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MealsScreen(id: data.id,)),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [data.color, data.color.withOpacity(0.4)],
                  begin: .topLeft,
                  end: .bottomRight,
                ),
                borderRadius: .all(.circular(23)),
              ),
              child: Center(
                child: Text(
                  data.title,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
