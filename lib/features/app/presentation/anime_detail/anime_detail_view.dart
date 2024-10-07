import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopper_network/core/di/inject.dart';
import 'package:chopper_network/core/helper/helper_functions.dart';
import 'package:chopper_network/core/utils/extensions/context_extensions.dart';
import 'package:chopper_network/core/utils/extensions/widget_extensions.dart';
import 'package:chopper_network/core/view/base_view.dart';
import 'package:chopper_network/core/widget/base_widget.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/presentation/anime_detail/cubit/anime_detail_cubit.dart';
import 'package:chopper_network/features/app/presentation/theme/text_styles.dart';
import 'package:chopper_network/features/app/presentation/widget/blur_container.dart';
import 'package:chopper_network/features/app/presentation/widget/custom_animated_button.dart';
import 'package:chopper_network/features/app/presentation/widget/custom_scaffold.dart';
import 'package:chopper_network/features/app/presentation/widget/radiused_cached_image_widget.dart';
import 'package:chopper_network/features/app/presentation/widget/score_text_widget.dart';
import 'package:chopper_network/features/app/presentation/widget/title_text_widget.dart';
import 'package:chopper_network/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

part 'widget/character_list_view_builder.dart';
part 'widget/detail_page_app_bar.dart';
part 'widget/genres_widget.dart';

class AnimeDetailView extends BaseView<AnimeDetailCubit, AnimeDetailState> {
  AnimeDetailView({required this.anime, super.key})
      : super(
          cubit: () => getIt<AnimeDetailCubit>(
            param1: anime.id,
          ),
        );

  final AnimeEntity anime;

  @override
  Widget builder(BuildContext context, AnimeDetailCubit cubit) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(context.topPadding + 20.h),
            DetailPageAppBar(
              onBackIconPressed: appRouter.pop,
              title: anime.title,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 20.h,
              ),
              child: BlurContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RadiusedCachedImageWidget(
                            imageUrl: anime.imageUrl,
                          ),
                          Gap(16.h),
                          TitleTextWidget(
                            title: anime.title,
                            maxLines: 3,
                          ),
                          ScoreTextWidget(
                            score: anime.score,
                          ),
                          Gap(8.h),
                          GenresWidget(anime: anime),
                          Gap(8.h),
                          Text(
                            anime.synopsis,
                            style: AppTextStyles.bodySmall,
                          ),
                          Gap(8.h),
                          Text(
                            context.l10n.characters,
                            style: AppTextStyles.labelSmall,
                          ),
                          Gap(8.h),
                        ],
                      ),
                    ),
                    const CharacterListBuilder(),
                    Gap(context.bottomOrDefaultPadding),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
