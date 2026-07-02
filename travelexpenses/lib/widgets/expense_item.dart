import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense_model.dart';
import '../providers/expenses_provider.dart';

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
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () => _showDeleteConfirmation(context),
        ),
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    final provider = Provider.of<ExpensesProvider>(context, listen: false);

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Expense?'),
        content: Text('Are you sure you want to delete "${expense.name}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              provider.removeExpense(expense);
              Navigator.pop(ctx);
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}