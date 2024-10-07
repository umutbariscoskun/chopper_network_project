import 'package:chopper_network/features/app/presentation/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('CustomScaffold builds correctly', (WidgetTester tester) async {
    // Mock FlavorConfig

    await tester.pumpWidget(
      MaterialApp(
        home: CustomScaffold(
          body: Container(),
          bottomNavigationBar: const Text('Bottom Bar'),
        ),
      ),
    );

    // Verify Scaffold is present
    expect(find.byType(Scaffold), findsOneWidget);

    // Verify RadialGradientBackground is present
    expect(find.byType(RadialGradientBackground), findsOneWidget);

    // Verify bottomNavigationBar is set as floatingActionButton
    expect(find.text('Bottom Bar'), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsNothing);
  });
}
