import 'dart:convert';

import 'package:chopper_network/features/app/data/model/anime_response_model.dart';
import 'package:chopper_network/features/app/data/model/character_response_model.dart';
import 'package:chopper_network/features/app/data/service/anime_service.dart';
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart';
import 'package:chopper_network/features/app/domain/use_case/get_top_anime_use_case.dart';
import 'package:mockito/annotations.dart';

import 'json_reader.dart';

@GenerateMocks([
  AnimeService,
  GetCharactersUseCase,
  GetTopAnimeUseCase,
])
void main() {}

const animeResponseDummyDataPath =
    'helper/dummy_data/anime_response_dummy.json';
const characterResponseDummyDataPath =
    'helper/dummy_data/character_response_dummy.json';

String get jsonAnimeRawData => readJson(animeResponseDummyDataPath);
String get jsonCharacterRawData => readJson(characterResponseDummyDataPath);

final animeModel = AnimeResponse.fromJson(
  jsonDecode(jsonAnimeRawData) as Map<String, dynamic>,
);
final jsonData = jsonDecode(jsonCharacterRawData) as Map<String, dynamic>;

final characterList = jsonData.entries
    .map(
      (entry) =>
          CharacterResponseModel.fromJson(entry.value as Map<String, dynamic>),
    )
    .toList();
