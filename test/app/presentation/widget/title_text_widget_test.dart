import 'package:chopper_network/features/app/presentation/theme/text_styles.dart';
import 'package:chopper_network/features/app/presentation/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TitleTextWidget displays text correctly',
      (WidgetTester tester) async {
    const testTitle = 'Test Title';
    const maxLines = 2;

    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return const Scaffold(
              body: TitleTextWidget(
                title: testTitle,
                maxLines: maxLines,
              ),
            );
          },
        ),
      ),
    );

    // Find the Text widget
    final textFinder = find.text(testTitle);
    expect(textFinder, findsOneWidget);

    // Verify the Text properties
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.maxLines, maxLines);
    expect(textWidget.overflow, TextOverflow.ellipsis);

    // Verify the text style
    final expectedStyle = AppTextStyles.headingMedium.copyWith(
      fontWeight: FontWeight.w700,
    );
    expect(textWidget.style, expectedStyle);
  });

  testWidgets('TitleTextWidget handles long text correctly',
      (WidgetTester tester) async {
    const testTitle =
        'This is a very long title that should definitely overflow and show ellipsis when constrained';
    const maxLines = 1;

    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return const Scaffold(
              body: SizedBox(
                width: 200, // Constrain the width to force overflow
                child: TitleTextWidget(
                  title: testTitle,
                  maxLines: maxLines,
                ),
              ),
            );
          },
        ),
      ),
    );

    // Find the Text widget
    final textFinder = find.byType(Text);
    expect(textFinder, findsOneWidget);

    // Verify that the text is truncated and ends with ellipsis
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.maxLines, maxLines);
    expect(textWidget.overflow, TextOverflow.ellipsis);
  });
}
