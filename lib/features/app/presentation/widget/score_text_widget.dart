import 'package:chopper_network/features/app/presentation/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ScoreTextWidget extends StatelessWidget {
  const ScoreTextWidget({
    required this.score,
    super.key,
  });

  final double score;

  @override
  Widget build(BuildContext context) {
    return Text(
      '${score.round()}/10',
      style: AppTextStyles.labelSmall,
    );
  }
}
