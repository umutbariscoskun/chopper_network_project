import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/presentation/anime_detail/anime_detail_view.dart';
import 'package:chopper_network/features/app/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('GenresWidget displays genres correctly',
      (WidgetTester tester) async {
    final testAnime = AnimeEntity(
      score: 9,
      synopsis: '',
      title: '',
      id: 2,
      imageUrl: '',
      episodes: 20,
      genres: [
        GenresEntity(name: 'Action', malId: 2, type: '', url: ''),
        GenresEntity(name: 'Comedy', malId: 2, type: '', url: ''),
        GenresEntity(name: 'Drama', malId: 2, type: '', url: ''),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ScreenUtilInit(
          designSize: const Size(375, 812),
          builder: (context, child) {
            return Scaffold(
              body: GenresWidget(anime: testAnime),
            );
          },
        ),
      ),
    );

    // Verify that all genres are displayed
    expect(find.text('Action  '), findsOneWidget);
    expect(find.text('Comedy  '), findsOneWidget);
    expect(find.text('Drama  '), findsOneWidget);

    // Verify the correct number of Text widgets
    expect(find.byType(Text), findsNWidgets(3));

    // Verify the style of the Text widgets
    final textWidgets = tester.widgetList<Text>(find.byType(Text));
    for (final textWidget in textWidgets) {
      expect(textWidget.style, equals(AppTextStyles.labelXSmall));
    }

    // Verify that the genres are in a Row
    expect(find.byType(Row), findsOneWidget);

    final row = tester.widget<Row>(find.byType(Row));
    expect(row.children.length, equals(3));
  });
}
