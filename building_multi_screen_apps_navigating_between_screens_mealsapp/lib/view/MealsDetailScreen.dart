import 'package:flutter/material.dart';
import '../models/mealsModel.dart';

class MealsDetail extends StatelessWidget {
  const MealsDetail({
    super.key,
    required this.data,
  });

  final Meals data;

  String get complexityText {
    return data.complex.name[0].toUpperCase() +
        data.complex.name.substring(1);
  }

  String get affordabilityText {
    return data.afford.name[0].toUpperCase() +
        data.afford.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          /// Image
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            stretch: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(data.title,style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),),
              background: Hero(
                tag: data.id,
                child: Image.network(
                  data.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(

            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  /// Info Card
                  Card(
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 16),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceAround,
                        children: [

                          _InfoTile(
                            icon: Icons.schedule,
                            title: "${data.duration} min",
                          ),

                          _InfoTile(
                            icon: Icons.speed,
                            title: complexityText,
                          ),

                          _InfoTile(
                            icon: Icons.attach_money,
                            title: affordabilityText,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  Text(
                    "Ingredients",
                    style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    elevation: 2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                      const NeverScrollableScrollPhysics(),
                      itemCount: data.ingredients.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading:  CircleAvatar(
                            child: Icon(Icons.restaurant,color: Theme.of(context).colorScheme.onPrimaryContainer,),
                          ),
                          title: Text(data.ingredients[index], style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 25),

                   Text(
                    "Steps",
                    style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Card(
                    elevation: 2,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                      const NeverScrollableScrollPhysics(),
                      itemCount: data.steps.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text("${index + 1}",style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: Theme.of(context).colorScheme.onPrimaryContainer,
                            ),),
                          ),
                          title: Text(data.steps[index],style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimaryContainer,
                          ),),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 30),

                   Text(
                    "Features",
                      style:  Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [

                      if (data.isGlutenFree)
                        const Chip(
                          label: Text("Gluten Free"),
                          avatar: Icon(Icons.check),
                        ),

                      if (data.isVegan)
                        const Chip(
                          label: Text("Vegan"),
                          avatar: Icon(Icons.check),
                        ),

                      if (data.isVegetarian)
                        const Chip(
                          label: Text("Vegetarian"),
                          avatar: Icon(Icons.check),
                        ),

                      if (data.isLactoseFree)
                        const Chip(
                          label: Text("Lactose Free"),
                          avatar: Icon(Icons.check),
                        ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color:Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style:  Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }
}