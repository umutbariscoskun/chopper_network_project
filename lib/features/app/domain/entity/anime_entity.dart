class AnimeEntity {
  AnimeEntity({
    required this.imageUrl,
    required this.title,
    required this.score,
  });

  final String imageUrl;
  final String title;
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
