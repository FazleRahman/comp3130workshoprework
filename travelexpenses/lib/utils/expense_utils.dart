import '../models/expense_model.dart';

double sumExpenses(List<Expense> expenses) {
  if (expenses.isEmpty) return 0.0;
  return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
}