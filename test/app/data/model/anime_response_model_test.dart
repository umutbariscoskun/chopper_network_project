import 'dart:convert';

import 'package:chopper_network/features/app/data/model/anime_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper/test_helper.dart';

void main() {
  const animeResponseDummyDataPath =
      'helper/dummy_data/anime_response_dummy.json';

  group('AnimeResponse Model Tests', () {
    test('should create AnimeResponse from JSON', () {
      final jsonData = jsonDecode(jsonAnimeRawData) as Map<String, dynamic>;
      final animeResponse = AnimeResponse.fromJson(jsonData);

      expect(animeResponse, isA<AnimeResponse>());
      expect(animeResponse.pagination, isA<Pagination>());
      expect(animeResponse.data, isA<List<AnimeModel>>());
    });

    test('should correctly parse Pagination', () {
      final jsonData = jsonDecode(jsonAnimeRawData) as Map<String, dynamic>;
      final animeResponse = AnimeResponse.fromJson(jsonData);

      expect(animeResponse.pagination.lastVisiblePage, isA<int>());
      expect(animeResponse.pagination.hasNextPage, isA<bool>());
      expect(animeResponse.pagination.currentPage, isA<int>());
      expect(animeResponse.pagination.items, isA<PaginationItems>());
    });

    test('should correctly parse PaginationItems', () {
      final jsonData = jsonDecode(jsonAnimeRawData) as Map<String, dynamic>;
      final animeResponse = AnimeResponse.fromJson(jsonData);

      expect(animeResponse.pagination.items.count, isA<int>());
      expect(animeResponse.pagination.items.total, isA<int>());
      expect(animeResponse.pagination.items.perPage, isA<int>());
    });

    test('should correctly parse AnimeModel list', () {
      final jsonData = jsonDecode(jsonAnimeRawData) as Map<String, dynamic>;
      final animeResponse = AnimeResponse.fromJson(jsonData);

      expect(animeResponse.data, isNotEmpty);
      expect(animeResponse.data.first, isA<AnimeModel>());
      expect(animeResponse.data.first.imageUrl, isA<String>());
      expect(animeResponse.data.first.title, isA<String>());
      expect(animeResponse.data.first.score, isA<double>());
    });

    test('should handle empty data list', () {
      final jsonData = {
        'pagination': {
          'last_visible_page': 0,
          'has_next_page': false,
          'current_page': 1,
          'items': {'count': 0, 'total': 0, 'per_page': 25}
        },
        'data': []
      };

      final animeResponse = AnimeResponse.fromJson(jsonData);

      expect(animeResponse.data, isEmpty);
    });

    test('should throw when creating from invalid JSON', () {
      final invalidJson = {
        'pagination': {
          'last_visible_page': 'invalid',
          'has_next_page': 'invalid',
          'current_page': 'invalid',
          'items': {
            'count': 'invalid',
            'total': 'invalid',
            'per_page': 'invalid'
          }
        },
        'data': [
          {
            'images': {
              'jpg': {'image_url': 123}
            },
            'title': 123,
            'score': 'invalid'
          }
        ]
      };

      expect(
        () => AnimeResponse.fromJson(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });
  });

  group('AnimeModel Tests', () {
    test('should create AnimeModel from JSON', () {
      final json = {
        'images': {
          'jpg': {'image_url': 'https://example.com/image.jpg'}
        },
        'title': 'Test Anime',
        'score': 8.5
      };

      final animeModel = AnimeModel.fromJson(json);

      expect(animeModel.imageUrl, equals('https://example.com/image.jpg'));
      expect(animeModel.title, equals('Test Anime'));
      expect(animeModel.score, equals(8.5));
    });

    test('should handle integer scores', () {
      final json = {
        'images': {
          'jpg': {'image_url': 'https://example.com/image.jpg'}
        },
        'title': 'Test Anime',
        'score': 8
      };

      final animeModel = AnimeModel.fromJson(json);

      expect(animeModel.score, equals(8.0));
      expect(animeModel.score, isA<double>());
    });
  });
}
