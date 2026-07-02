import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ExpenseItem extends StatelessWidget {
  final Expense expense;

  const ExpenseItem({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        leading: Text(
          '\$${expense.amount.toStringAsFixed(2)}',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        title: Text(expense.name),
        subtitle: Row(
          children: [
            Icon(categoryIcons[expense.category], size: 16, color: Colors.grey),
            const SizedBox(width: 6),
            Text(expense.formattedDate),
          ],
        ),
      ),
    );
  }
}