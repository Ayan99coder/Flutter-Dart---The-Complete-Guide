import 'package:adding_interactivity_more_widgets_theming_ecpense_tracker_app/data/data.dart';
import 'package:adding_interactivity_more_widgets_theming_ecpense_tracker_app/model/models.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      shape: RoundedRectangleBorder(),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              expense.title,
              style: theme.titleMedium?.copyWith(letterSpacing: 0.6),
            ),
            SizedBox(height: 5),
            Text(
              "${expense.description}",
              style: theme.bodyMedium?.copyWith(
                letterSpacing: 0.1,
                fontWeight: .w200,
              ),
            ),
            Row(
              mainAxisAlignment: .end,
              children: [
                Text("Category : ${expense.category.name.toString()}"),
                Spacer(),
                Icon(categoryIcons[expense.category]),
                Text(
                  expense.formatedDate.toString(),
                  style: theme.bodyMedium?.copyWith(
                    letterSpacing: 0.1,
                    fontWeight: .w200,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
