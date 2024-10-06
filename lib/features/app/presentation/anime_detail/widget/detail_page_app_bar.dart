part of '../anime_detail_view.dart';

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedButton(
      onPressed: appRouter.pop,
      child: Row(
        children: [
          Icon(
            Icons.chevron_left,
            size: 32.sp,
          ),
          Text(title)
        ],
      ).symmetricHDefaultPadding,
    );
  }
}
