import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Viewmodel/Provider.dart';
import '../model/models.dart';
import 'Custom_card.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({super.key});

  @override
  Widget build(BuildContext context) {
    void removerAndShowSnackBar(Expense expense) {
      final provider = context.read<ExpenseProvider>();
      final expenseIndex = provider.expenseList.indexOf(expense);
      provider.removeExpense(expense);

      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            duration: Duration(seconds: 3),
            content: Text("deleted"),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                provider.insertExpense(expenseIndex, expense);
              },
            ),
          ),
        );
    }

    final provider = context.watch<ExpenseProvider>().expenseList;
    return ListView.builder(
      itemCount: provider.length,
      itemBuilder: (ctx, i) {
        final expense = provider[i];
        return Dismissible(
          background: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error.withOpacity(0.75),
              borderRadius: .circular(20),
            ),
            margin: .symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              vertical: Theme.of(context).cardTheme.margin!.vertical,
            ),
          ),
          key: ValueKey(expense.id),

          onDismissed: (dismissed) {
            removerAndShowSnackBar(expense);
          },
          child: CustomCard(expense: expense),
        );
      },
    );
  }
}
