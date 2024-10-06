import 'dart:convert';

import 'package:chopper_network/features/app/data/model/anime_response_model.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
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
      expect(animeResponse.data.first.synopsis, isA<String>());
      expect(animeResponse.data.first.genres, isA<List>());
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
            'score': 'invalid',
            'synopsis': 123,
            'genres': 'invalid'
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
        'mal_id': 1,
        'episodes': 20,
        'title': 'Test Anime',
        'score': 8.5,
        'synopsis': 'This is a test synopsis',
        'genres': []
      };

      final animeModel = AnimeModel.fromJson(json);

      expect(animeModel.imageUrl, equals('https://example.com/image.jpg'));
      expect(animeModel.title, equals('Test Anime'));
      expect(animeModel.score, equals(8.5));
      expect(animeModel.synopsis, equals('This is a test synopsis'));
      expect(animeModel.genres, isEmpty);
    });

    test('should handle integer scores', () {
      final json = {
        'images': {
          'jpg': {'image_url': 'https://example.com/image.jpg'}
        },
        'mal_id': 1,
        'episodes': 20,
        'title': 'Test Anime',
        'score': 8,
        'synopsis': 'This is a test synopsis',
        'genres': []
      };

      final animeModel = AnimeModel.fromJson(json);

      expect(animeModel.score, equals(8.0));
      expect(animeModel.score, isA<double>());
    });

    test('should handle non-empty genres list', () {
      final json = {
        'images': {
          'jpg': {'image_url': 'https://example.com/image.jpg'}
        },
        'mal_id': 1,
        'episodes': 20,
        'title': 'Test Anime',
        'score': 8.5,
        'synopsis': 'This is a test synopsis',
        'genres': [
          {
            'mal_id': 1,
            'type': 'anime',
            'name': 'Action',
            'url': 'https://myanimelist.net/anime/genre/1/Action'
          },
          {
            'mal_id': 2,
            'type': 'anime',
            'name': 'Adventure',
            'url': 'https://myanimelist.net/anime/genre/2/Adventure'
          }
        ]
      };

      final animeModel = AnimeModel.fromJson(json);

      expect(animeModel.genres, isNotEmpty);
      expect(animeModel.genres.length, equals(2));
      expect(animeModel.genres.first, isA<GenresModel>());
      expect(animeModel.genres.first.name, equals('Action'));
      expect(animeModel.genres.last.name, equals('Adventure'));
    });
  });
}
