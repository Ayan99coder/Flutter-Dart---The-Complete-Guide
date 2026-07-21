import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/view/FavouriteScreen.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/view/HomePage.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/viewModel/Provider.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> pages = const [
    HomeScreen(),
    Favouritescreen(),
    Center(child: Text("Profile")),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MealProvider>();

    return Scaffold(
drawer: Drawerwidget(currentScreen: 'HomeScreen'),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          provider.selectedIndex == 0 ? "Categories :" : "Your Favorites",
        ),
      ),

      body: pages[provider.selectedIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: provider.selectedIndex,
        onDestinationSelected: provider.changePage,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.grid_view),
            label: "Categories",
          ),
          NavigationDestination(icon: Icon(Icons.favorite), label: "Favorites"),
        ],
      ),
    );
  }
}
