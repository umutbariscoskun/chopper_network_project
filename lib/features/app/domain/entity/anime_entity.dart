class AnimeEntity {
  AnimeEntity({
    required this.synopsis,
    required this.imageUrl,
    required this.title,
    required this.score,
    required this.genres,
    required this.episodes,
    required this.id,
  });

  final int id;
  final int? episodes;
  final String imageUrl;
  final String title;
  final String synopsis;
  final List<GenresEntity> genres;
  final double score;
}

class PaginationEntity {
  PaginationEntity({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.itemCount,
    required this.itemTotal,
    required this.itemPerPage,
  });

  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final int itemCount;
  final int itemTotal;
  final int itemPerPage;
}

class AnimePaginationEntity {
  AnimePaginationEntity({
    required this.pagination,
    required this.animeList,
  });

  final PaginationEntity pagination;
  final List<AnimeEntity> animeList;
}

class GenresEntity {
  GenresEntity({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  final int malId;
  final String type;
  final String name;
  final String url;
}
