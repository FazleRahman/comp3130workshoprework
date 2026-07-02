import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'providers/expenses_provider.dart';
import 'services/auth_services.dart';
import 'screens/auth_screen.dart';
import 'widgets/new_expense.dart';
import 'widgets/expenses_list.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<ExpensesProvider>(create: (_) => ExpensesProvider()),
      ],
      child: MaterialApp(
        title: 'Travel Expenses',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 161, 109, 170),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 161, 109, 170),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 35),
        ),
        home: const AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return StreamBuilder(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Expenses(
            toggleTheme: _toggleTheme,
            isDarkMode: _isDarkMode,
          );
        } else {
          return const AuthScreen();
        }
      },
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

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        children: [
          Expanded(
            child: ExpensesList(),
          ),
        ],
      ),
    );
  }
}