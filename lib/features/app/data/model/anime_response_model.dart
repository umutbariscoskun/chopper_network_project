class Pagination {
  Pagination({
    required this.lastVisiblePage,
    required this.hasNextPage,
    required this.currentPage,
    required this.items,
  });
  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        lastVisiblePage: json['last_visible_page'] as int,
        hasNextPage: json['has_next_page'] as bool,
        currentPage: json['current_page'] as int,
        items: PaginationItems.fromJson(json['items'] as Map<String, dynamic>),
      );

  final int lastVisiblePage;
  final bool hasNextPage;
  final int currentPage;
  final PaginationItems items;
}

class PaginationItems {
  PaginationItems({
    required this.count,
    required this.total,
    required this.perPage,
  });
  factory PaginationItems.fromJson(Map<String, dynamic> json) =>
      PaginationItems(
        count: json['count'] as int,
        total: json['total'] as int,
        perPage: json['per_page'] as int,
      );

  final int count;
  final int total;
  final int perPage;
}

// Anime model
class AnimeModel {
  AnimeModel({
    required this.imageUrl,
    required this.title,
    required this.score,
  });
  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        imageUrl: json['images']['jpg']['image_url'] as String,
        title: json['title'] as String,
        score: (json['score'] as num).toDouble(),
      );

  final String imageUrl;
  final String title;
  final double score;
}

// AnimeResponse model
class AnimeResponse {
  AnimeResponse({
    required this.pagination,
    required this.data,
  });
  factory AnimeResponse.fromJson(Map<String, dynamic> json) => AnimeResponse(
        pagination:
            Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
        data: (json['data'] as List<dynamic>)
            .map((x) => AnimeModel.fromJson(x as Map<String, dynamic>))
            .toList(),
      );

  final Pagination pagination;
  final List<AnimeModel> data;
}
