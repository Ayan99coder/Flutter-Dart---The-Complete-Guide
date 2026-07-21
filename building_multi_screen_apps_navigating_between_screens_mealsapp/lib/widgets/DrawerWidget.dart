import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/view/bottomnav.dart';
import 'package:flutter/material.dart';

import '../view/filterScreen.dart';

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({super.key, required this.currentScreen});

  final String currentScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.primaryContainer,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.restaurant, size: 45, color: Colors.white),
                const SizedBox(width: 15),
                Text(
                  "Meals App",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text(
              "Meals",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);

              if (currentScreen == 'HomeScreen') {
                return;
              }

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const TabsScreen(),
                ),
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              "Settings",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          ListTile(
            leading: const Icon(Icons.filter_alt),
            title: const Text(
              "Filters",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            onTap: () {
              Navigator.pop(context);

              if (currentScreen == 'FilterScreen') {
                return;
              }

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => const Filterscreens(),
                ),
              );
            },
          ),

          const Spacer(),

          const Divider(),

          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About", style: TextStyle(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
