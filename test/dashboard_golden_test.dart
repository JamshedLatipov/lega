import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:romchi2/screens/dashboard_screen.dart';

void main() {
  testWidgets('DashboardScreen golden test', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 3.0;

    await tester.pumpWidget(
      const MaterialApp(
        home: DashboardScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );

    await tester.pumpAndSettle();

    await expectLater(
      find.byType(DashboardScreen),
      matchesGoldenFile('goldens/dashboard_screen.png'),
    );

    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
}
