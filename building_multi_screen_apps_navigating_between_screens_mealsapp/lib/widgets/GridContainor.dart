import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/models/GridViewModal.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/view/MealsScreen.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/viewModel/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Gridcontainor extends StatelessWidget {
  const Gridcontainor({super.key, required this.view});

  final Gridviewmodal view;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        context.read<MealProvider>().loadMeals(view.id);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MealsPage(view: view)),
        );
      },
      borderRadius: .circular(23),

      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .topLeft,
            end: .bottomRight,
            colors: [view.color, view.color.withOpacity(0.5)],
          ),
          borderRadius: .circular(23),
        ),
        child: Center(
          child: Text(
            view.title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
