import 'package:chopper_network/core/di/inject.dart';
import 'package:chopper_network/core/helper/helper_functions.dart';
import 'package:chopper_network/core/routers/app_router.dart';
import 'package:chopper_network/core/utils/extensions/context_extensions.dart';
import 'package:chopper_network/core/utils/extensions/widget_extensions.dart';
import 'package:chopper_network/core/view/base_view.dart';
import 'package:chopper_network/core/widget/base_widget.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/presentation/anime_list/cubit/anime_list_cubit.dart';
import 'package:chopper_network/features/app/presentation/widget/blur_container.dart';
import 'package:chopper_network/features/app/presentation/widget/custom_animated_button.dart';
import 'package:chopper_network/features/app/presentation/widget/custom_scaffold.dart';
import 'package:chopper_network/features/app/presentation/widget/radiused_cached_image_widget.dart';
import 'package:chopper_network/features/app/presentation/widget/score_text_widget.dart';
import 'package:chopper_network/features/app/presentation/widget/title_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
part 'widget/anime_list_builder.dart';
part 'widget/anime_card.dart';

class AnimeListView extends BaseView<AnimeListCubit, AnimeListState> {
  AnimeListView({super.key}) : super(cubit: getIt.call);

  @override
  Widget builder(BuildContext context, AnimeListCubit cubit) {
    return CustomScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: const AnimeListBuilder().symmetricHDefaultPadding,
          ),
        ],
      ),
    );
  }
}
