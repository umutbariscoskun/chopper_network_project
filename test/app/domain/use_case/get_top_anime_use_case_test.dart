import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/domain/repository/anime_repository.dart';
import 'package:chopper_network/features/app/domain/repository/native_repository.dart';
import 'package:chopper_network/features/app/domain/use_case/get_top_anime_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'use_case_mock_gen_test.mocks.dart';

void main() {
  GetTopAnimeUseCase? usecase;
  AnimeRepository? mockRepo;
  AnimeEntity? entity;
  AnimePaginationEntity? animePaginationEntity;
  PaginationEntity? paginationEntity;
  NativeRepository? mockNativeRepo;

  setUp(() {
    mockRepo = FakeRepo();
    mockNativeRepo = MockNativeRepository();
    usecase = GetTopAnimeUseCase(
      mockRepo!,
      mockNativeRepo!,
    );

    entity = AnimeEntity(
      id: 1,
      episodes: 20,
      imageUrl: 'test.jpg',
      title: 'title',
      score: 4,
      synopsis: '',
      genres: [],
    );
    paginationEntity = PaginationEntity(
      lastVisiblePage: 10,
      hasNextPage: true,
      currentPage: 1,
      itemCount: 20,
      itemTotal: 200,
      itemPerPage: 20,
    );

    animePaginationEntity = AnimePaginationEntity(
      pagination: paginationEntity!,
      animeList: [
        entity!,
      ],
    );
  });

  test(
    'should GET anime pagination entity from the repository',
    () async {
      when(mockNativeRepo!.getNetworkStatus())
          .thenAnswer((_) async => const Right(true));
      when(mockRepo!.getTopAnime(page: 1))
          .thenAnswer((_) async => Right(animePaginationEntity!));

      final testResult = await usecase!(1);
      testResult.fold((l) => null, (r) {
        //check id
        expect(entity!.title, r.animeList.first.title);
      });
      //check response
      expect(
        testResult,
        Right(animePaginationEntity),
      );
    },
  );
}
