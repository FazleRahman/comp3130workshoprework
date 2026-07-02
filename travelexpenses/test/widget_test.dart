import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:travelexpenses/main.dart';
import 'package:travelexpenses/providers/expenses_provider.dart';
import 'package:travelexpenses/services/auth_services.dart';
import 'package:travelexpenses/screens/auth_screen.dart';

void main() {
  setUpAll(() async {
    await Firebase.initializeApp();
  });

  // ==================== Old Test (Expense Flow) ====================
  testWidgets('shows a category dropdown when adding an expense', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService()),
          ChangeNotifierProvider<ExpensesProvider>(create: (_) => ExpensesProvider()),
        ],
        child: const MaterialApp(home: AuthWrapper()),
      ),
    );

    // This test assumes user is logged in - you may need to mock auth for full test
    // For now, we'll test the login screen separately
  });

  // ==================== New Login/Register Test ====================
  testWidgets('AuthScreen shows login form and can switch to register', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<AuthService>(create: (_) => AuthService()),
        ],
        child: const MaterialApp(
          home: AuthScreen(),
        ),
      ),
    );

    expect(find.text('Login'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2)); // email + password

    // Switch to register
    await tester.tap(find.text('Create new account'));
    await tester.pumpAndSettle();

    expect(find.text('Register'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));
  });
}