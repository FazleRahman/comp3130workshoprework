import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:travelexpenses/main.dart';
import 'package:travelexpenses/models/expense_model.dart';     // ← This was missing
import 'package:travelexpenses/providers/expenses_provider.dart';

void main() {
  testWidgets('shows a category dropdown when adding an expense', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (context) => ExpensesProvider(),
        child: const MyApp(),
      ),
    );

    // Open the add expense modal
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Check for the category dropdown
    final categoryField = find.byType(DropdownButtonFormField<Category>);
    expect(categoryField, findsOneWidget);

    await tester.tap(categoryField);
    await tester.pumpAndSettle();

    expect(find.text('Food'), findsWidgets);
    expect(find.text('Vehicle'), findsWidgets);
    expect(find.text('Sports'), findsWidgets);
    expect(find.text('Miscellaneous'), findsWidgets);
  });
}