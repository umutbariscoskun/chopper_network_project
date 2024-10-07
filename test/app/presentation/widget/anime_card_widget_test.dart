import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/presentation/anime_list/anime_list_view.dart';
import 'package:chopper_network/features/app/presentation/widget/custom_animated_button.dart';
import 'package:chopper_network/features/app/presentation/widget/radiused_cached_image_widget.dart';
import 'package:chopper_network/features/app/presentation/widget/score_text_widget.dart';
import 'package:chopper_network/features/app/presentation/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gap/gap.dart';

void main() {
  testWidgets('AnimeCard displays correctly', (WidgetTester tester) async {
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
              body: AnimeCard(
                item: testAnime,
                onCardPressed: () {},
              ),
            );
          },
        ),
      ),
    );

    // Verify CustomAnimatedButton is present
    expect(find.byType(CustomAnimatedButton), findsOneWidget);

    // Verify RadiusedCachedImageWidget is present with correct properties
    final imageFinder = find.byType(RadiusedCachedImageWidget);
    expect(imageFinder, findsOneWidget);
    final imageWidget = tester.widget<RadiusedCachedImageWidget>(imageFinder);
    expect(imageWidget.imageUrl, testAnime.imageUrl);
    expect(imageWidget.height, 520.h);

    // Verify TitleTextWidget is present with correct properties
    final titleFinder = find.byType(TitleTextWidget);
    expect(titleFinder, findsOneWidget);
    final titleWidget = tester.widget<TitleTextWidget>(titleFinder);
    expect(titleWidget.title, testAnime.title);
    expect(titleWidget.maxLines, 2);

    // Verify ScoreTextWidget is present with correct properties
    final scoreFinder = find.byType(ScoreTextWidget);
    expect(scoreFinder, findsOneWidget);
    final scoreWidget = tester.widget<ScoreTextWidget>(scoreFinder);
    expect(scoreWidget.score, testAnime.score);

    // Verify the overall structure
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Spacer), findsOneWidget);
    expect(find.byType(Gap), findsNWidgets(2));
  });
}
