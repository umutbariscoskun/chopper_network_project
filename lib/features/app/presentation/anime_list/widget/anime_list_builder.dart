part of '../anime_list_view.dart';

class AnimeListBuilder extends BaseWidget<AnimeListCubit, AnimeListState> {
  const AnimeListBuilder({super.key});

  @override
  Widget build(
    BuildContext context,
    AnimeListCubit cubit,
    AnimeListState state,
  ) {
    return state.when(
      error: Text.new,
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator.adaptive()),
      loaded: (AnimeListLoaded state) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return PageView.builder(
              controller: PageController(
                viewportFraction: 0.85,
              ),
              onPageChanged: (index) async {
                await cubit.onIndexChanged(index);
              },
              scrollDirection: Axis.vertical,
              itemCount: state.animeList.length,
              itemBuilder: (context, index) {
                final item = state.animeList[index];

                return Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 0 : 10.h,
                    bottom: 10.h,
                  ),
                  child: Center(
                    child: SizedBox(
                      width: context.width,
                      height: constraints.maxHeight * 0.85,
                      child: BlurContainer(
                        child: AnimeCard(
                          onCardPressed: () =>
                              appRouter.push(AnimeDetailRoute(anime: item)),
                          item: item,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
