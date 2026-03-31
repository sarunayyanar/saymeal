import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saymeal/main.dart';

void main() {
  testWidgets('SayMeal smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: SayMealApp(),
      ),
    );

    // Verify that our app starts.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
