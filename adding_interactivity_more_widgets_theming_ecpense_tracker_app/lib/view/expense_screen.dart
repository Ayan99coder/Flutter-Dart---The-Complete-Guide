import 'package:adding_interactivity_more_widgets_theming_ecpense_tracker_app/view/BucketScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Viewmodel/Provider.dart';
import '../widgets/custom_listView.dart';
import '../widgets/Chart.dart';
import '../data/data.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  Future<void> pickDate() async {
    final provider = context.read<ExpenseProvider>();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: provider.selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      provider.selectedDate = pickedDate;
      provider.notifyListeners(); // 🔥 IMPORTANT
    }
  }

  void modalBottomSheet() {
    final readProvider = context.read<ExpenseProvider>();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      builder: (_) {
        final keyBoard = MediaQuery.of(context).viewInsets.bottom;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(12, 40, 12, keyBoard + 16),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  TextField(
                    onChanged: (value) {
                      readProvider.titleValue = value;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: .circular(10)),
                      labelText: 'Title',
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    onChanged: (value) {
                      readProvider.descriptionValue = value;
                    },
                    maxLines: 5,
                    minLines: 1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: .circular(10)),
                      labelText: 'Description',
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Charges',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.black54),
                  ),
                  SizedBox(height: 3),
                  TextField(
                    controller: readProvider.numberController,
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: .circular(10)),
                      prefixIcon: Icon(Icons.currency_exchange),
                    ),
                  ),
                  Row(
                    children: [
                      Consumer<ExpenseProvider>(
                        builder: (context, provider, _) {
                          return DropdownButton<Category>(
                            value: provider.selectedCategory,
                            items: Category.values.map((e) {
                              return DropdownMenuItem<Category>(
                                value: e,
                                child: Text(e.name),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value == null) return;
                              provider.selectedCategory = value;
                            },
                          );
                        },
                      ),
                      Spacer(),
                      Consumer<ExpenseProvider>(
                        builder: (context, provider, _) {
                          return Text(
                            provider.selectedDate == null
                                ? "Select Date"
                                : "${provider.selectedDate!.day}-${provider.selectedDate!.month}-${provider.selectedDate!.year}",
                          );
                        },
                      ),
                      IconButton(
                        onPressed: pickDate,
                        icon: Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          final error = readProvider.validation();

                          if (error != null) {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: const Text("Validation Error"),
                                content: Text(error),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          await readProvider.saveTask();
                          Navigator.pop(context);
                        },

                        child: Text('Save this'),
                      ),
                      SizedBox(width: 5),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },

                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final expenseList = context.watch<ExpenseProvider>().expenseList;
    final size = MediaQuery.of(context).size.width;
    Widget mainBody;
    if (expenseList.isEmpty) {
      mainBody = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 72,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            const SizedBox(height: 16),
            Text(
              'No expenses yet!',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.black45),
            ),
            const SizedBox(height: 6),
            Text(
              'Tap + to add your first expense',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.black38),
            ),
          ],
        ),
      );
    } else {
      if (size < 600) {
        mainBody = Column(
          children: [
            // ── bar chart ──────────────────────────────────────────────
            ExpenseChart(expenses: expenseList),
            // ── expense list ───────────────────────────────────────────
            Expanded(child: CustomListview()),
          ],
        );
      } else {
        mainBody = Row(
          children: [
            Expanded(child: ExpenseChart(expenses: expenseList)),
            Expanded(child: CustomListview()),
          ],
        );
      }
    }

    return Scaffold(
      body: mainBody,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: modalBottomSheet, icon: Icon(Icons.add)),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return Bucketscreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
        title: Text("Expense Tracker"),
        centerTitle: true,
      ),
    );
  }
}
