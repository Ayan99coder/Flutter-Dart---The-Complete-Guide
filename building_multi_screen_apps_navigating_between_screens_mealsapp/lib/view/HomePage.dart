import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/widgets/Categories.dart';
import 'package:flutter/material.dart';

import '../widgets/DrawerWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [Expanded(child: Categories())]),

    );
  }
}
