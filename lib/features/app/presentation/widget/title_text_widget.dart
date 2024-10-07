import 'package:chopper_network/features/app/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    required this.title,
    required this.maxLines,
    super.key,
  });

  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      style: AppTextStyles.headingMedium.copyWith(
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
