import 'dart:async';

import 'package:chopper_network/core/cubit/base_cubit.dart';
import 'package:chopper_network/core/utils/extensions/cubit_extension.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/domain/use_case/get_top_anime_use_case.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'anime_list_state.dart';

@injectable
class AnimeListCubit extends BaseCubit<AnimeListState> {
  AnimeListCubit(
    GetTopAnimeUseCase getTopAnimeUseCase,
  )   : _getTopAnimeUseCase = getTopAnimeUseCase,
        super(const AnimeListInitial());

  final GetTopAnimeUseCase _getTopAnimeUseCase;
  final _list = <AnimeEntity>[];

  int _page = 1;
  bool isLastPage = false;
  int _lastLoadedIndex = 0;

  @override
  Future<void> onBindingCreated() async {
    final result = await performAnimeRequest();
    if (result != null) {
      _page++;

      _list.addAll(result.animeList);

      emit(AnimeListLoaded([..._list]));
    }

    super.onBindingCreated();
  }

  Future<AnimePaginationEntity?> performAnimeRequest() async {
    return foldAsync(
      () async => _getTopAnimeUseCase.call(_page),
    );
  }

  Future<void> onIndexChanged(int index) async {
    if (index > _lastLoadedIndex &&
        index > 0 &&
        index % (20 * 0.9).round() == 0 &&
        !isLastPage) {
      _page++;
      await getAnimes();
      _lastLoadedIndex = index;
    }
  }

  Future<void> getAnimes() async {
    final result = await performAnimeRequest();

    if (result != null) {
      _list.addAll(result.animeList);

      emit(AnimeListLoaded([..._list]));
    }
  }
}
