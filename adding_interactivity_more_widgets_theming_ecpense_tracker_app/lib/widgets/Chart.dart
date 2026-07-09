import 'package:flutter/material.dart';

import '../data/data.dart';
import '../model/models.dart';

// ─── Single bar column for one category ───────────────────────────────────────
class ChartBar extends StatelessWidget {
  const ChartBar({super.key, required this.fill});

  /// 0.0 – 1.0  (fraction of max expense)
  final double fill;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: FractionallySizedBox(
          heightFactor: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // percentage label
              Text(
                '${(fill * 100).toStringAsFixed(0)}%',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: isDark ? Colors.white70 : Colors.deepPurple[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
              ),
              const SizedBox(height: 4),
              // the actual bar
              Flexible(
                flex: 8,
                child: FractionallySizedBox(
                  heightFactor: fill == 0 ? 0.01 : fill,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                        bottom: Radius.circular(4),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: isDark
                            ? [
                                const Color(0xFFCE93D8),
                                const Color(0xFF7B1FA2),
                              ]
                            : [
                                const Color(0xFFCE93D8),
                                const Color(0xFF6A1B9A),
                              ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              // empty bottom spacer so labels sit below chart area
              const Flexible(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Full chart card ───────────────────────────────────────────────────────────
class ExpenseChart extends StatelessWidget {
  const ExpenseChart({super.key, required this.expenses});

  final List<Expense> expenses;

  /// Build one ExpenseBucket per category from the current expense list.
  List<ExpenseBucket> get _buckets => [
        ExpenseBucket.forCategory(expenses, Category.food),
        ExpenseBucket.forCategory(expenses, Category.leisure),
        ExpenseBucket.forCategory(expenses, Category.travel),
        ExpenseBucket.forCategory(expenses, Category.sports),
      ];

  double get _maxTotal =>
      _buckets.fold(0, (max, b) => b.totalExpenses > max ? b.totalExpenses : max);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF2D1B4E), const Color(0xFF1A0A2E)]
              : [const Color(0xFFEDE7F6), const Color(0xFFD1C4E9)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.18),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── bars row ──────────────────────────────────────────────────
          SizedBox(
            height: 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: _buckets.map((bucket) {
                final fill =
                    _maxTotal == 0 ? 0.0 : bucket.totalExpenses / _maxTotal;
                return ChartBar(fill: fill);
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),
          // ── divider ───────────────────────────────────────────────────
          Divider(
            color: isDark
                ? Colors.white24
                : Colors.deepPurple.withOpacity(0.2),
            thickness: 1,
          ),
          const SizedBox(height: 10),
          // ── category icons row ────────────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _buckets.map((bucket) {
              return Column(
                children: [
                  Icon(
                    categoryIcons[bucket.category],
                    size: 22,
                    color: isDark
                        ? Colors.purple[200]
                        : Colors.deepPurple[700],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${bucket.totalExpenses.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          color: isDark
                              ? Colors.white60
                              : Colors.deepPurple[600],
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
