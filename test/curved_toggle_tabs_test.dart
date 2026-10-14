import 'package:curved_toggle_tabs/curved_toggle_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CurveToggleTabs switches between first and second tab', (
    WidgetTester tester,
  ) async {
    int selectedIndex = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CurveToggleTabs(
            firstTabTitle: 'Log In',
            secondTabTitle: 'Sign Up',
            firstTabView: const Text('Login Content'),
            secondTabView: const Text('Sign Up Content'),
            onTabChanged: (index) {
              selectedIndex = index;
            },
          ),
        ),
      ),
    );

    // Verify initial state shows First Tab content
    expect(find.text('Login Content'), findsOneWidget);
    expect(find.text('Sign Up Content'), findsNothing);

    // Tap on the 'Sign Up' tab
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify it switched to Second Tab content
    expect(selectedIndex, 1);
    expect(find.text('Sign Up Content'), findsOneWidget);
  });
}
