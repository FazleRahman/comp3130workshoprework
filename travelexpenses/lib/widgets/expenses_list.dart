import 'package:flutter/material.dart';
import '../models/expense_model.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> allExpenses;
  final void Function(Expense expense) onRemoveExpense;

  const ExpensesList({
    super.key,
    required this.allExpenses,
    required this.onRemoveExpense,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (BuildContext context, int index) {
        final expense = allExpenses[index];
        return Dismissible(
          key: ValueKey(expense.id),
          onDismissed: (direction) => onRemoveExpense(expense),
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: ExpenseItem(expense: expense),
        );
      },
    );
  }
}