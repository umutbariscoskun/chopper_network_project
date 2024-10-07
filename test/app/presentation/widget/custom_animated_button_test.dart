import 'package:chopper_network/features/app/presentation/widget/custom_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomAnimatedButton renders child correctly',
      (WidgetTester tester) async {
    const childKey = Key('child-widget');
    const child = SizedBox(key: childKey, width: 100, height: 50);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CustomAnimatedButton(
            child: child,
          ),
        ),
      ),
    );

    expect(find.byKey(childKey), findsOneWidget);
  });

  testWidgets('CustomAnimatedButton responds to tap',
      (WidgetTester tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomAnimatedButton(
            onPressed: () {
              tapped = true;
            },
            child: const Text('Tap me'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Tap me'));
    await tester.pumpAndSettle();

    // Verify OnPressed call
    expect(tapped, isTrue);
  });
}
