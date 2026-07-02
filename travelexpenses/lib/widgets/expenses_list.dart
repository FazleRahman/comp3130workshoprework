import 'package:flutter/material.dart';
import '../models/expense_model.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> allExpenses;

  const ExpensesList({super.key, required this.allExpenses});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allExpenses.length,
      itemBuilder: (BuildContext context, int index) {
        return ExpenseItem(expense: allExpenses[index]);
      },
    );
  }
}
