import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/viewModel/Provider.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Filterscreens extends StatelessWidget {
  const Filterscreens({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MealProvider>();

    return Scaffold(
      drawer: Drawerwidget(currentScreen: "FilterScreen"),

      appBar: AppBar(title: const Text("Filters")),

      body: Column(
        children: [
          SwitchListTile(
            title: const Text("Gluten Free"),

            subtitle: const Text("Only include gluten free meals"),

            value: provider.glutenFree,

            onChanged: (value) {
              context.read<MealProvider>().changeFilter("gluten", value);
            },
          ),

          SwitchListTile(
            title: const Text("Lactose Free"),

            subtitle: const Text("Only include lactose free meals"),

            value: provider.lactoseFree,

            onChanged: (value) {
              context.read<MealProvider>().changeFilter("lactose", value);
            },
          ),

          SwitchListTile(
            title: const Text("Vegetarian"),

            subtitle: const Text("Only include vegetarian meals"),

            value: provider.vegetarian,

            onChanged: (value) {
              context.read<MealProvider>().changeFilter("vegetarian", value);
            },
          ),

          SwitchListTile(
            title: const Text("Vegan"),

            subtitle: const Text("Only include vegan meals"),

            value: provider.vegan,

            onChanged: (value) {
              context.read<MealProvider>().changeFilter("vegan", value);
            },
          ),
        ],
      ),
    );
  }
}
