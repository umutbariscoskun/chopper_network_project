import 'dart:convert';
import 'package:chopper_network/features/app/data/model/character_response_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helper/test_helper.dart'; // Assume this exists to read JSON files

void main() {
  const characterResponseDummyDataPath =
      'helper/dummy_data/character_response_dummy.json';

  group('CharacterResponseModel Tests', () {
    test('should create a CharacterResponseModel instance', () {
      final model = CharacterResponseModel(
        name: 'John Doe',
        imageUrl: 'https://example.com/image.jpg',
        role: 'Protagonist',
      );

      expect(model.name, equals('John Doe'));
      expect(model.imageUrl, equals('https://example.com/image.jpg'));
      expect(model.role, equals('Protagonist'));
    });

    test('should create CharacterResponseModels from dummy JSON data', () {
      final jsonData = jsonDecode(jsonCharacterRawData) as List<dynamic>;

      final characterList = jsonData
          .map(
            (entry) =>
                CharacterResponseModel.fromJson(entry as Map<String, dynamic>),
          )
          .toList();

      expect(characterList, isNotEmpty);
      expect(
        characterList.length,
        equals(3),
      ); // Assuming there are 3 characters in the dummy data

      // Test the first character
      expect(characterList[0].name, equals('Fern'));
      expect(
          characterList[0].imageUrl,
          equals(
              'https://cdn.myanimelist.net/images/characters/13/519083.jpg?s=b280b410b588ebcd3fd30ac6fad02978'));
      expect(characterList[0].role, equals('Main'));

      // Test the second character
      expect(characterList[1].name, equals('Frieren'));
      expect(
          characterList[1].imageUrl,
          equals(
              'https://cdn.myanimelist.net/images/characters/7/525105.jpg?s=1706604ec2ca141a172526b8dedf3177'));
      expect(characterList[1].role, equals('Main'));

      // Test the third character
      expect(characterList[2].name, equals('Stark'));
      expect(
          characterList[2].imageUrl,
          equals(
              'https://cdn.myanimelist.net/images/characters/2/523292.jpg?s=ea781ce6864ae29a56f5ce3d223d9496'));
      expect(characterList[2].role, equals('Main'));
    });

    test('should throw when creating from invalid JSON', () {
      final invalidJson = {
        'character': {
          'name': 'Invalid Character',
          'images': {
            'jpg': {} // Missing 'image_url'
          }
        },
        'role': 'Unknown'
      };

      expect(
        () => CharacterResponseModel.fromJson(invalidJson),
        throwsA(isA<TypeError>()),
      );
    });

    test('should handle empty strings in JSON', () {
      final jsonWithEmptyStrings = {
        'character': {
          'name': '',
          'images': {
            'jpg': {'image_url': ''}
          }
        },
        'role': ''
      };

      final model = CharacterResponseModel.fromJson(jsonWithEmptyStrings);

      expect(model.name, isEmpty);
      expect(model.imageUrl, isEmpty);
      expect(model.role, isEmpty);
    });

    test('should handle null values in JSON (if applicable)', () {
      final jsonWithNulls = {
        'character': {
          'name': null,
          'images': {
            'jpg': {'image_url': null}
          }
        },
        'role': null
      };

      expect(
        () => CharacterResponseModel.fromJson(jsonWithNulls),
        throwsA(
          isA<TypeError>(),
        ), // Or handle nulls if the model is updated to support them
      );
    });
  });
}
