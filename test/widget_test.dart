import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:romchi2/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app starts and shows the MainScreen
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
