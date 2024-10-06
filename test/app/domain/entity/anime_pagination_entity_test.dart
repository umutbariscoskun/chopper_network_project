import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final entity = AnimeEntity(
    episodes: 20,
    id: 1,
    imageUrl: 'test.jpg',
    title: 'title',
    score: 4,
    synopsis: '',
    genres: [],
  );
  final paginationEntity = PaginationEntity(
    lastVisiblePage: 10,
    hasNextPage: true,
    currentPage: 1,
    itemCount: 20,
    itemTotal: 200,
    itemPerPage: 20,
  );

  final animePaginationEntity = AnimePaginationEntity(
    pagination: paginationEntity,
    animeList: [
      entity,
    ],
  );

  test('should be a subclass of a entity', () async {
    expect(animePaginationEntity, isA<AnimePaginationEntity>());
    expect(animePaginationEntity.animeList, isA<List<AnimeEntity>>());

    expect(paginationEntity, isA<PaginationEntity>());

    expect(entity, isA<AnimeEntity>());
  });
}
