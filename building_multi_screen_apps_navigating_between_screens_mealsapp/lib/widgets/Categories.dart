import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/widgets/GridContainor.dart';
import 'package:flutter/cupertino.dart';

import '../data/dummyData.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [for (final cat in categories) Gridcontainor(view: cat)],
    );
  }
}
