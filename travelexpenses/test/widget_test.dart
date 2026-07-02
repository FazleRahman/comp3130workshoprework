import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:travelexpenses/main.dart';
import 'package:travelexpenses/models/expense_model.dart';

void main() {
  testWidgets('shows a category dropdown when adding an expense', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

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
