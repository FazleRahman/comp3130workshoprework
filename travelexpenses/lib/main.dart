import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/expense_model.dart';
import 'providers/expenses_provider.dart';
import 'widgets/expenses_list.dart';
import 'widgets/new_expense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpensesProvider(),
      child: MaterialApp(
        title: 'Travel Expenses',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 161, 109, 170),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          cardTheme: const CardThemeData(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            elevation: 2,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 161, 109, 170),
            foregroundColor: Colors.white,
          ),
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 161, 109, 170),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          cardTheme: const CardThemeData(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            elevation: 2,
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 35),
        ),
        themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
        home: Expenses(
          toggleTheme: _toggleTheme,
          isDarkMode: _isDarkMode,
        ),
      ),
    );
  }
}

class Expenses extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const Expenses({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const NewExpense(),
    );
  }

  Widget _buildCategoryChart(List<Expense> expenses) {
    final Map<Category, double> categoryTotals = {};
    for (var expense in expenses) {
      categoryTotals[expense.category] = 
          (categoryTotals[expense.category] ?? 0) + expense.amount;
    }

    final List<MapEntry<Category, double>> sortedData = 
        categoryTotals.entries.toList()
          ..sort((a, b) => b.value.compareTo(a.value));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: sortedData.map((entry) {
          final barHeight = (entry.value / 400) * 140;
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 50,
                height: barHeight.clamp(40.0, 160.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Icon(
                categoryIcons[entry.key],
                size: 28,
              ),
              const SizedBox(height: 4),
              Text(
                '\$${entry.value.toStringAsFixed(0)}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final expensesProvider = Provider.of<ExpensesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Expenses'),
        backgroundColor: widget.isDarkMode
            ? const Color.fromARGB(255, 45, 45, 50)
            : const Color.fromARGB(255, 161, 109, 170),
        actions: [
          IconButton(
            onPressed: widget.toggleTheme,
            icon: Icon(widget.isDarkMode ? Icons.light_mode : Icons.dark_mode),
          ),
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                const Text(
                  'Expenses by Category',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: _buildCategoryChart(expensesProvider.expenses),
                ),
              ],
            ),
          ),
          Expanded(
            child: ExpensesList(),
          ),
        ],
      ),
    );
  }
}