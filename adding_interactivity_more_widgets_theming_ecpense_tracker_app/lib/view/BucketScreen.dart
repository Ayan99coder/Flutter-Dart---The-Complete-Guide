import 'package:adding_interactivity_more_widgets_theming_ecpense_tracker_app/Viewmodel/Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bucketscreen extends StatelessWidget {
  const Bucketscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ExpenseProvider>(
        builder: (context, provider, child) {
          final data = provider.expenseBuckets;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, i) {
              return Card(
                child: ListTile(
                  title: Text(data[i].category.name),
                  subtitle: Text(data[i].totalExpenses.toStringAsFixed(2)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
