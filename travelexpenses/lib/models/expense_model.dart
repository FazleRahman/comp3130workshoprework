import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const _uuid = Uuid();

enum Category { food, stay, experience, shopping, vehicle, sports, miscellaneous }

// Icons for each category
const categoryIcons = {
  Category.food: Icons.fastfood_rounded,
  Category.vehicle: Icons.directions_car,
  Category.sports: Icons.sports_soccer,
  Category.miscellaneous: Icons.category,
};

final formatter = DateFormat.yMd();

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

  String get formattedDate => formatter.format(date);
}