part of '../anime_detail_view.dart';

class GenresWidget extends StatelessWidget {
  const GenresWidget({
    required this.anime,
    super.key,
  });

  final AnimeEntity anime;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (final genre in anime.genres)
          Text(
            '${genre.name}  ',
            style: AppTextStyles.labelXSmall,
          ),
      ],
    );
  }
}
