import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders a basic smoke test widget', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('passenger_app'),
          ),
        ),
      ),
    );

    expect(find.text('passenger_app'), findsOneWidget);
  });
}
