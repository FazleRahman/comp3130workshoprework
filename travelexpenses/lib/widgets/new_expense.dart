import 'package:flutter/material.dart';
import '../models/expense_model.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onSaveExpense});

  final void Function(Expense expense) onSaveExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.food;

  void _openDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 2);
    final lastDate = DateTime(now.year + 1);

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _submitExpense() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.tryParse(_amountController.text) ?? 0.0;

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return; // You can show a dialog for validation later
    }

    final newExpense = Expense(
      name: enteredTitle,
      amount: enteredAmount,
      date: _selectedDate!,
      category: _selectedCategory,
    );

    widget.onSaveExpense(newExpense);
    Navigator.pop(context); // Close modal
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 40,
            decoration: const InputDecoration(labelText: 'Expense Title'),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Expense Amount',
                    prefixText: '\$ ',
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'Pick Date'
                          : _selectedDate!.toString().substring(0, 10),
                    ),
                    IconButton(
                      onPressed: _openDatePicker,
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<Category>(
            value: _selectedCategory,
            decoration: const InputDecoration(labelText: 'Category'),
            items: const [
              DropdownMenuItem(value: Category.food, child: Text('Food')),
              DropdownMenuItem(value: Category.vehicle, child: Text('Vehicle')),
              DropdownMenuItem(value: Category.sports, child: Text('Sports')),
              DropdownMenuItem(
                value: Category.miscellaneous,
                child: Text('Miscellaneous'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _selectedCategory = value;
                });
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _submitExpense,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}