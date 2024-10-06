import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RadiusedCachedImageWidget extends StatelessWidget {
  const RadiusedCachedImageWidget({
    required this.imageUrl,
    super.key,
    this.height,
  });

  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.fitHeight,
        width: double.infinity,
        height: height,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
