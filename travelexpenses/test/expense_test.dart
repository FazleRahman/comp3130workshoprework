import 'package:flutter_test/flutter_test.dart';
import 'package:travelexpenses/models/expense_model.dart';
import 'package:travelexpenses/providers/expenses_provider.dart';
import 'package:travelexpenses/utils/expense_utils.dart';

void main() {
  group('sumExpenses', () {
    test('returns 0 for empty list', () {
      expect(sumExpenses([]), 0.0);
    });

    test('calculates correct sum for multiple expenses', () {
      final expenses = [
        Expense(name: 'Food', amount: 100, date: DateTime.now(), category: Category.food),
        Expense(name: 'Transport', amount: 50, date: DateTime.now(), category: Category.vehicle),
        Expense(name: 'Hotel', amount: 200, date: DateTime.now(), category: Category.stay),
      ];

      expect(sumExpenses(expenses), 350.0);
    });
  });

  group('ExpensesProvider', () {
    late ExpensesProvider provider;

    setUp(() {
      provider = ExpensesProvider();
    });

    test('initial expenses are loaded', () {
      expect(provider.expenses.length, greaterThan(0));
    });

    test('addExpense adds an expense and notifies listeners', () {
      final initialCount = provider.expenses.length;
      final newExpense = Expense(
        name: 'Test Expense',
        amount: 99.99,
        date: DateTime.now(),
        category: Category.miscellaneous,
      );

      provider.addExpense(newExpense);

      expect(provider.expenses.length, initialCount + 1);
      expect(provider.expenses.last.name, 'Test Expense');
    });

    test('removeExpense removes an expense', () {
      final expenseToRemove = provider.expenses.first;
      final initialCount = provider.expenses.length;

      provider.removeExpense(expenseToRemove);

      expect(provider.expenses.length, initialCount - 1);
    });
  });
}