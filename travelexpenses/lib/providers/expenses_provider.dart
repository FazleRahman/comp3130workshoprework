import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class ExpensesProvider with ChangeNotifier {
  final List<Expense> _expenses = [
    Expense(
      name: 'Birthday Dinner',
      amount: 300,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      name: 'Kayaking tour',
      amount: 70,
      date: DateTime.now(),
      category: Category.experience,
    ),
  ];

  List<Expense> get expenses => _expenses;   // getter

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();   // ← Important: notifies listeners
  }

  void removeExpense(Expense expense) {
    _expenses.remove(expense);
    notifyListeners();
  }
}