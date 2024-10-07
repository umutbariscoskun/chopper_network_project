part of '../anime_list_view.dart';

class AnimeCard extends StatelessWidget {
  const AnimeCard({
    required this.onCardPressed,
    required this.item,
    super.key,
  });
  final AnimeEntity item;
  final VoidCallback? onCardPressed;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedButton(
      onPressed: onCardPressed,
      child: Container(
        padding: EdgeInsets.all(16.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadiusedCachedImageWidget(
              imageUrl: item.imageUrl,
              height: 520.h,
            ),
            const Spacer(),
            TitleTextWidget(
              title: item.title,
              maxLines: 2,
            ),
            Gap(8.h),
            ScoreTextWidget(
              score: item.score,
            ),
            Gap(context.bottomOrDefaultPadding),
          ],
        ),
      ),
    );
  }
}
