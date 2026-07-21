import 'package:expense_tracker_app_riverpod/model/expense_model.dart';
import 'package:expense_tracker_app_riverpod/provider/ExpenseProvider.dart';
import 'package:expense_tracker_app_riverpod/provider/ExpenseformProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddExpenseBottomSheet extends ConsumerStatefulWidget {
  const AddExpenseBottomSheet({super.key});

  @override
  ConsumerState<AddExpenseBottomSheet> createState() =>
      _AddExpenseBottomSheetState();
}

class _AddExpenseBottomSheetState extends ConsumerState<AddExpenseBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final formProvider = ref.read(expenseFormProvider.notifier);
    final formWatchProvider = ref.watch(expenseFormProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        final keyboard = MediaQuery.of(context).viewInsets.bottom;
        final isWideScreen = constraints.maxWidth >= 600;

        return Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, keyboard + 16),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                /// Phone Layout
                if (!isWideScreen) ...[
                  TextField(
                    onChanged: (value) {
                      formProvider.setTitle(value);
                    },
                    decoration: const InputDecoration(
                      labelText: 'Expense Title',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    onChanged: (value) {
                      formProvider.setAmount(double.parse(value));
                    },
                    keyboardType: .number,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  DropdownButton<Category>(
                    value: formWatchProvider.cat,
                    items: Category.values.map((e) {
                      return DropdownMenuItem<Category>(
                        value: e,
                        child: Text(e.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == null) return;
                      formProvider.setCategory(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  ...Temperature.values.map((e) {
                    return GestureDetector(
                      onTap: () {
                        formProvider.setTemperature(e);
                      },
                      child: Container(
                        padding: .symmetric(horizontal: 10, vertical: 5),
                        margin: .all(10),
                        decoration: BoxDecoration(
                          color: formWatchProvider.temp == e
                              ? temperatureColors[e]!.withOpacity(.5)
                              : Colors.transparent,
                          border: Border.all(
                            color: temperatureColors[e]!,
                            width: formWatchProvider.temp == e ? 2 : 1,
                          ),
                        ),
                        child: Text(e.name),
                      ),
                    );
                  }),
                ],

                /// Tablet/Desktop Layout
                if (isWideScreen)
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            formProvider.setTitle(value);
                          },
                          decoration: const InputDecoration(
                            labelText: 'Expense Title',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            formProvider.setAmount(double.parse(value));
                          },
                          decoration: const InputDecoration(
                            labelText: 'Amount',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                if (isWideScreen)
                  Row(
                    children: [
                      DropdownButton<Category>(
                        value: formWatchProvider.cat,
                        items: Category.values.map((e) {
                          return DropdownMenuItem<Category>(
                            value: e,
                            child: Text(e.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value == null) return;
                          formProvider.setCategory(value);
                        },
                      ),
                      const SizedBox(width: 16),
                      ...Temperature.values.map((e) {
                        return GestureDetector(
                          onTap: () {
                            formProvider.setTemperature(e);
                          },
                          child: Container(
                            padding: .symmetric(horizontal: 10, vertical: 5),
                            margin: .all(10),
                            decoration: BoxDecoration(
                              color: formWatchProvider.temp == e
                                  ? temperatureColors[e]!.withOpacity(.5)
                                  : Colors.transparent,
                              border: Border.all(
                                color: temperatureColors[e]!,
                                width: formWatchProvider.temp == e ? 2 : 1,
                              ),
                            ),
                            child: Text(e.name),
                          ),
                        );
                      }),
                    ],
                  ),

                const SizedBox(height: 20),

                FilledButton(
                  onPressed: () {
                    final e = formProvider.validation();
                    if (e != null) {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return AlertDialog(
                            title: const Text("Invalid Input"),
                            content: Text(e),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // Dialog close
                                },
                                child: const Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
                    final expense = ExpenseModel(
                      temperature: formWatchProvider.temp,
                      title: formWatchProvider.title,
                      amount: formWatchProvider.amount,
                      date: DateTime.now(),
                      category: formWatchProvider.cat,
                    );
                    ref.read(expenseProvider.notifier).saveExpense(expense);
                    if (!mounted) return;
                    ref.read(expenseFormProvider.notifier).reset();
                    Navigator.pop(context);
                  },
                  child: const Text("Add Expense"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomListView extends ConsumerWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: ListView.builder(
        itemCount: ref.watch(expenseProvider).expenses.length,

        itemBuilder: (_, i) {
          final watchRef = ref.watch(expenseProvider);
          final data = watchRef.expenses[i];

          return Dismissible(
            onDismissed: (value) {
              final removedExpense = ref
                  .read(expenseProvider.notifier)
                  .whileDismiss(data);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${removedExpense.title} removed'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      ref
                          .read(expenseProvider.notifier)
                          .saveExpense(removedExpense);
                    },
                  ),
                ),
              );
            },
            key: ValueKey(data.id),
            child: ListTile(
              onTap: () {},
              style: ListTileStyle.drawer,
              contentPadding: .symmetric(vertical: 5, horizontal: 10),
              shape: RoundedRectangleBorder(borderRadius: .circular(23)),
              title: Text(data.title),
              subtitle: Text(data.amount.toString()),
              leading: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  color: temperatureColors[data.temperature]!.withOpacity(0.5),
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: temperatureColors[data.temperature]!,
                  ),
                ),
              ),
              trailing: Icon(iconSelection[data.category]),
            ),
          );
        },
      ),
    );
  }
}
