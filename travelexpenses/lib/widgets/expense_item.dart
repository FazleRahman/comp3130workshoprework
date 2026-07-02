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
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        title: Text(
          expense.name,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          '${expense.date.year}-${expense.date.month.toString().padLeft(2, '0')}-'
          '${expense.date.day.toString().padLeft(2, '0')} '
          '${expense.date.hour.toString().padLeft(2, '0')}:'
          '${expense.date.minute.toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 13),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}