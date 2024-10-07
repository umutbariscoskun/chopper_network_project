import 'dart:ui';

import 'package:chopper_network/features/app/presentation/widget/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('BlurContainer has correct structure and properties',
      (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return BlurContainer(
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
    );

    // Verify that BlurContainer uses ClipRRect
    expect(find.byType(ClipRRect), findsOneWidget);

    // Verify that BlurContainer uses BackdropFilter
    expect(find.byType(BackdropFilter), findsOneWidget);

    // Verify that BlurContainer uses DecoratedBox
    expect(find.byType(DecoratedBox), findsOneWidget);

    // Verify the child is present (the red container)
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Container && widget.color == Colors.red,
      ),
      findsOneWidget,
    );

    // Verify the BorderRadius
    // ignore: omit_local_variable_types
    final ClipRRect clipRRect = tester.widget(
      find.byType(ClipRRect).first,
    );
    expect(clipRRect.borderRadius, BorderRadius.circular(12.r));

    // Verify the BackdropFilter properties
    // ignore: omit_local_variable_types
    final BackdropFilter backdropFilter =
        tester.widget(find.byType(BackdropFilter).first);
    expect(backdropFilter.filter, ImageFilter.blur(sigmaX: 60, sigmaY: 60));

    // Verify the DecoratedBox properties
    // ignore: omit_local_variable_types
    final DecoratedBox decoratedBox =
        tester.widget(find.byType(DecoratedBox).first);
    // ignore: omit_local_variable_types
    final BoxDecoration decoration = decoratedBox.decoration as BoxDecoration;
    expect(decoration.color, Colors.white.withOpacity(0.12));
    expect(decoration.borderRadius, BorderRadius.circular(12.r));
  });
}
