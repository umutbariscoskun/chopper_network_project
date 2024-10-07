import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:chopper_network/features/app/data/model/anime_response_model.dart';
import 'package:chopper_network/features/app/data/model/character_response_model.dart';
import 'package:chopper_network/features/app/data/service/anime_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_web_server/mock_web_server.dart';

import '../../../helper/test_helper.dart';

void main() {
  late AnimeService animeService;
  late MockWebServer mockWebServer;

  final headers = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
  };

  setUp(() async {
    mockWebServer = MockWebServer();
    await mockWebServer.start();

    final chopper = ChopperClient(
      baseUrl: Uri.parse(mockWebServer.url),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: const JsonConverter(),
    );

    animeService = AnimeService.create(chopper);
  });

  tearDown(() {
    mockWebServer.shutdown();
  });

  group('AnimeService', () {
    const page = 1;

    test('should return AnimeResponse when the response code is 200', () async {
      final jsonData = json.decode(jsonAnimeRawData);
      mockWebServer.enqueue(
        body: json.encode(jsonData),
        headers: headers,
      );

      final response = await animeService.getTopAnime(page: page);

      expect(response.isSuccessful, true);

      if (response.isSuccessful) {
        final jsonBody = response.body as Map<String, dynamic>;

        // Convert to AnimeResponse model
        final animeResponse = AnimeResponse.fromJson(jsonBody);

        expect(animeResponse, isA<AnimeResponse>());
        expect(animeResponse.pagination, isNotNull);
        expect(animeResponse.data, isNotNull);
        expect(animeResponse.data.isNotEmpty, true);
      }
    });

    test('should return CharacterResponse when the response code is 200',
        () async {
      final jsonData = json.decode(jsonCharacterRawData);
      mockWebServer.enqueue(
        body: json.encode(jsonData),
        headers: headers,
      );

      final response = await animeService.getCharacters(id: 1);

      expect(response.isSuccessful, true);

      if (response.isSuccessful) {
        final jsonBody = response.body as List<dynamic>;

        // Convert to List<CharacterResponse> model
        final characterResponses = jsonBody
            .map(
              (item) => CharacterResponseModel.fromJson(
                item as Map<String, dynamic>,
              ),
            )
            .toList();

        expect(characterResponses, isA<List<CharacterResponseModel>>());
        expect(characterResponses.isNotEmpty, true);

        // Check  first character
        final firstCharacter = characterResponses[0];
        expect(firstCharacter.name, isNotNull);
        expect(firstCharacter.name, 'Fern');
        expect(firstCharacter.role, 'Main');
      }
    });

    test('should throw ServerFailure when the response code is 500', () async {
      mockWebServer.enqueue(
        body: 'Internal Server Error',
        headers: headers,
        httpCode: 500,
      );

      final response = await animeService.getTopAnime(page: page);

      expect(response.isSuccessful, false);
      expect(response.statusCode, 500);
    });
  });
}
