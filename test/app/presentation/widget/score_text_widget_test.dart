import 'package:chopper_network/features/app/presentation/theme/text_styles.dart';
import 'package:chopper_network/features/app/presentation/widget/score_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ScoreTextWidget displays rounded score with proper formatting',
      (WidgetTester tester) async {
    const testScore = 7.4;

    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return const Scaffold(
              body: ScoreTextWidget(score: testScore),
            );
          },
        ),
      ),
    );

    // Find the Text widget
    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    // Verify the text content (rounded down)
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.data, '7/10');

    // Verify the text style
    expect(textWidget.style, AppTextStyles.labelSmall);
  });

  testWidgets('ScoreTextWidget handles integer scores correctly',
      (WidgetTester tester) async {
    const testScore = 8.0;

    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return const Scaffold(
              body: ScoreTextWidget(score: testScore),
            );
          },
        ),
      ),
    );
    // Find the Text widget
    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    // Verify the text content
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.data, '8/10');
  });
}
