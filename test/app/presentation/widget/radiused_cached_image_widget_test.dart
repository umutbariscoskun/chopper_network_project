import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper_network/features/app/presentation/widget/radiused_cached_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const testImageUrl = 'https://example.com/image.jpg';
  const testHeight = 200.0;

  Widget buildTestWidget({double? height}) {
    return MaterialApp(
      home: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          body: RadiusedCachedImageWidget(
            imageUrl: testImageUrl,
            height: height,
          ),
        ),
      ),
    );
  }

  testWidgets('RadiusedCachedImageWidget builds correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget());

    // Verify ClipRRect is present
    expect(find.byType(ClipRRect), findsOneWidget);

    // Verify CachedNetworkImage is present
    expect(find.byType(CachedNetworkImage), findsOneWidget);

    // Verify ClipRRect properties
    final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
    expect(clipRRect.borderRadius, BorderRadius.circular(8.r));

    // Verify CachedNetworkImage properties
    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedImage.imageUrl, testImageUrl);
    expect(cachedImage.fit, BoxFit.fitHeight);
    expect(cachedImage.width, double.infinity);
    expect(cachedImage.height, null);
  });

  testWidgets('RadiusedCachedImageWidget respects height parameter',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget(height: testHeight));

    final cachedImage =
        tester.widget<CachedNetworkImage>(find.byType(CachedNetworkImage));
    expect(cachedImage.height, testHeight);
  });

  testWidgets('RadiusedCachedImageWidget shows placeholder while loading',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget());

    // Initially, we should see a CircularProgressIndicator
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('RadiusedCachedImageWidget shows error icon on error',
      (WidgetTester tester) async {
    await tester.pumpWidget(buildTestWidget());

    // Find the CachedNetworkImage widget
    final cachedImageFinder = find.byType(CachedNetworkImage);
    // ignore: omit_local_variable_types
    final CachedNetworkImage cachedImage = tester.widget(cachedImageFinder);

    // Get a valid BuildContext
    final BuildContext context = tester.element(cachedImageFinder);

    // Call the errorWidget function
    final errorWidget = cachedImage.errorWidget!(
      context,
      testImageUrl,
      Exception('Test error'),
    );

    // Pump the error widget
    await tester.pumpWidget(MaterialApp(home: errorWidget));

    // We should see an error icon
    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
