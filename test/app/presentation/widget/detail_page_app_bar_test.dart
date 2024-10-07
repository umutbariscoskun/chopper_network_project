import 'package:chopper_network/features/app/presentation/anime_detail/anime_detail_view.dart';
import 'package:chopper_network/features/app/presentation/widget/custom_animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('DetailPageAppBar displays correctly and handles tap',
      (WidgetTester tester) async {
    const testTitle = 'Test Title';
    var onBackIconPressedCalled = false;

    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return Scaffold(
              body: DetailPageAppBar(
                title: testTitle,
                onBackIconPressed: () {
                  onBackIconPressedCalled = true;
                },
              ),
            );
          },
        ),
      ),
    );

    // Verify the CustomAnimatedButton is present
    expect(find.byType(CustomAnimatedButton), findsOneWidget);

    // Verify the Row is present
    expect(find.byType(Row), findsOneWidget);

    // Verify the Icon is present and has correct properties
    final iconFinder = find.byType(Icon);
    expect(iconFinder, findsOneWidget);
    final icon = tester.widget<Icon>(iconFinder);
    expect(icon.icon, Icons.chevron_left);
    expect(icon.size, 32.sp);

    // Verify the title Text is present and correct
    expect(find.text(testTitle), findsOneWidget);

    // Verify the structure of the Row
    final row = tester.widget<Row>(find.byType(Row));
    expect(row.children.length, 2); // Icon and Text

    await tester.tap(find.byIcon(Icons.chevron_left));
    await tester.pumpAndSettle();

    expect(onBackIconPressedCalled, isTrue);
  });
}
