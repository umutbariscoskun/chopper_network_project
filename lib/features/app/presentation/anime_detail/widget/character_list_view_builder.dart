part of '../anime_detail_view.dart';

class CharacterListBuilder
    extends BaseWidget<AnimeDetailCubit, AnimeDetailState> {
  const CharacterListBuilder({super.key});

  @override
  Widget build(
    BuildContext context,
    AnimeDetailCubit cubit,
    AnimeDetailState state,
  ) {
    return state.when(
      error: Text.new,
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      loaded: (AnimeDetailLoaded state) {
        return SizedBox(
          height: 230.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.characterList.length,
            itemBuilder: (context, index) {
              final character = state.characterList[index];
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(
                        left: 20.w,
                        right: 8.w,
                      )
                    : EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: CachedNetworkImage(
                        imageUrl: character.imageUrl,
                        width: 100.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 100.w,
                      child: Text(
                        character.name,
                        style: AppTextStyles.labelSmall,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      character.role,
                      style: AppTextStyles.labelXSmall,
                    ),
                    const Spacer(),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
