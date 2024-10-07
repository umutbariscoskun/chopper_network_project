part of '../anime_detail_view.dart';

class DetailPageAppBar extends StatelessWidget {
  const DetailPageAppBar({
    required this.title,
    required this.onBackIconPressed,
    super.key,
  });

  final String title;
  final VoidCallback? onBackIconPressed;
  @override
  Widget build(BuildContext context) {
    return CustomAnimatedButton(
      onPressed: onBackIconPressed,
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
