class Anime {
  Anime({
    required this.images,
    required this.title,
    required this.score,
  });

  final Images images;
  final String title;
  final double score;
}

class Images {
  Images({required this.jpg});

  final ImageUrls jpg;
}

class ImageUrls {
  ImageUrls({
    required this.imageUrl,
    required this.smallImageUrl,
    required this.largeImageUrl,
  });

  final String imageUrl;
  final String smallImageUrl;
  final String largeImageUrl;
}
