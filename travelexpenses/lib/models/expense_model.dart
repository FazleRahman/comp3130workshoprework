import 'package:uuid/uuid.dart';

const _uuid = Uuid();

enum Category { food, stay, experience, shopping }

class Expense {
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Category category;

  Expense({
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = _uuid.v4();
}
