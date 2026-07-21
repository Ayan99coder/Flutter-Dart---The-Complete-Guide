import 'package:expense_tracker_app_riverpod/view/Widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class ExpenseScreen extends StatelessWidget {
  const ExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    void showModalSheet() {
      showModalBottomSheet(
        context: context,
        builder: (_) => AddExpenseBottomSheet(),
      );
    }

    return Scaffold(
      backgroundColor: colorTheme.surface,

      appBar: AppBar(
        foregroundColor: colorTheme.onPrimary,
        backgroundColor: colorTheme.primary,
        title: Text(
          "Expense Tracker",
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalSheet();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [CustomListView()]),
      ),
    );
  }
}
