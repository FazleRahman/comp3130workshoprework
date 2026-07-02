import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense_model.dart';
import '../providers/expenses_provider.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpensesProvider>(
      builder: (context, expensesProvider, child) {
        return ListView.builder(
          itemCount: expensesProvider.expenses.length,
          itemBuilder: (BuildContext context, int index) {
            final expense = expensesProvider.expenses[index];
            return Dismissible(
              key: ValueKey(expense.id),
              onDismissed: (direction) {
                // Optional: Show confirmation (Step 6)
                _showDeleteConfirmation(context, expense, expensesProvider);
              },
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
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context, Expense expense, ExpensesProvider provider) {
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