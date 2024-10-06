// GenresEntity model
class GenresModel {
  GenresModel({
    required this.malId,
    required this.type,
    required this.name,
    required this.url,
  });

  factory GenresModel.fromJson(Map<String, dynamic> json) => GenresModel(
        malId: json['mal_id'] as int,
        type: json['type'] as String,
        name: json['name'] as String,
        url: json['url'] as String,
      );

  final int malId;
  final String type;
  final String name;
  final String url;
}

// Updated AnimeModel
class AnimeModel {
  AnimeModel({
    required this.imageUrl,
    required this.title,
    required this.score,
    required this.synopsis,
    required this.genres,
    required this.episodes,
    required this.id,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['mal_id'] as int,
      imageUrl: json['images']['jpg']['image_url'] as String,
      title: json['title'] as String,
      episodes: json['episodes'] != null ? json['episodes'] as int : null,
      score: (json['score'] as num).toDouble(),
      synopsis: json['synopsis'] as String,
      genres: (json['genres'] as List<dynamic>)
          .map((x) => GenresModel.fromJson(x as Map<String, dynamic>))
          .toList(),
    );
  }
  final int id;
  final String imageUrl;
  final String title;
  final double score;
  final int? episodes;

  final String synopsis;
  final List<GenresModel> genres;
}

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
