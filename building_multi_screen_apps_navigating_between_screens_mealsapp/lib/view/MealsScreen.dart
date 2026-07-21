import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/models/GridViewModal.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/view/MealsDetailScreen.dart';
import 'package:building_multi_screen_apps_navigating_between_screens_mealsapp/viewModel/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class MealsPage extends StatelessWidget {

  const MealsPage({super.key, required this.view});

  final Gridviewmodal view;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          view.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView.builder(
        itemCount: context.watch<MealProvider>().meals.length,
        itemBuilder: (_, i) {
          final data = context.watch<MealProvider>().meals[i];
          return InkWell(
            splashColor: Theme.of(context).primaryColor,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return MealsDetail(data: data);
                  },
                ),
              );
            },
            child: Card(
              margin: .all(8),
              shape: RoundedRectangleBorder(borderRadius: .circular(9)),

              child: Stack(
                children: [
                  FadeInImage(
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(data.imageUrl),
                    fit: .cover,
                    height: 200,
                    width: double.infinity,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: () {
                        final content = context
                            .read<MealProvider>()
                            .toggleFavourite(data);
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(content)));
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.white54,
                          shape: .circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: context.read<MealProvider>().isFavourites(data)
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black54),
                      child: Column(
                        children: [
                          Text(
                            data.title,
                            maxLines: 2,
                            softWrap: true,
                            overflow: .ellipsis,
                            style: TextStyle(
                              color: Theme.of(
                                context,
                              ).colorScheme.onPrimaryContainer,
                              fontWeight: .bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: .center,
                            children: [
                              Icon(
                                Icons.punch_clock,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                              Text(
                                ":${data.duration.toString()} min",
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                  fontSize: 20,
                                  fontWeight: .bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.shopping_bag_outlined,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                              Text(
                                data.complex.name[0].toUpperCase() +
                                    data.complex.name.substring(1),
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                  fontSize: 20,
                                  fontWeight: .bold,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(
                                Icons.satellite_outlined,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimaryContainer,
                              ),
                              Text(
                                data.afford.name[0].toUpperCase() +
                                    data.afford.name.substring(1),
                                style: TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onPrimaryContainer,
                                  fontSize: 20,
                                  fontWeight: .bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
