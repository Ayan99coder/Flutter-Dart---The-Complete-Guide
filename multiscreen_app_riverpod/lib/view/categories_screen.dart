import 'package:flutter/material.dart';
import 'package:multiscreen_app_riverpod/Widgets/category_list.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final texttheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Available menu :",
              style: texttheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),

            ),
            SizedBox(height: 10,),
            Expanded(child: CategoryList()),
          ],
        ),
      ),
    );
  }
}
