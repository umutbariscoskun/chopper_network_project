import 'dart:convert';
import 'dart:developer';

import 'package:chopper_network/core/error/failure.dart';
import 'package:chopper_network/features/app/data/model/anime_response_model.dart';
import 'package:chopper_network/features/app/data/model/character_response_model.dart';
import 'package:chopper_network/features/app/data/service/anime_service.dart';
import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/domain/repository/anime_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AnimeRepository)
@lazySingleton
class AnimeRepositoryImpl implements AnimeRepository {
  AnimeRepositoryImpl(AnimeService animeService) : _animeService = animeService;
  final AnimeService _animeService;

  @override
  Future<Either<Failure, List<CharacterEntity>>> getCharacters({
    required int id,
  }) async {
    try {
      final response = await _animeService.getCharacters(id: id);

      if (response.isSuccessful) {
        // Parse the response body and cast to Map<String, dynamic>
        final jsonBody =
            json.decode(response.bodyString) as Map<String, dynamic>;

        // Extract the 'data' list from the JSON
        final charactersData = jsonBody['data'] as List<dynamic>;

        // Convert each item in the list to a CharacterModel, then to a CharacterEntity
        final characters = charactersData.map((characterData) {
          final characterModel = CharacterResponseModel.fromJson(
            characterData as Map<String, dynamic>,
          );
          return CharacterEntity(
            name: characterModel.name,
            imageUrl: characterModel.imageUrl,
            role: characterModel.role,
          );
        }).toList();

        return Right(characters);
      } else {
        return const Left(ServerFailure("getCharacters request error"));
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AnimePaginationEntity>> getTopAnime({
    required int page,
  }) async {
    try {
      final response = await _animeService.getTopAnime(page: page);

      if (response.isSuccessful) {
        // Parse the response body and cast to Map<String, dynamic>
        final jsonBody =
            json.decode(response.bodyString) as Map<String, dynamic>;

        // Convert to AnimeResponse model
        final animeResponse = AnimeResponse.fromJson(jsonBody);

        // Convert AnimeResponse to AnimePaginationEntity
        final animePaginationEntity = AnimePaginationEntity(
          pagination: PaginationEntity(
            lastVisiblePage: animeResponse.pagination.lastVisiblePage,
            hasNextPage: animeResponse.pagination.hasNextPage,
            currentPage: animeResponse.pagination.currentPage,
            itemCount: animeResponse.pagination.items.count,
            itemTotal: animeResponse.pagination.items.total,
            itemPerPage: animeResponse.pagination.items.perPage,
          ),
          animeList: animeResponse.data
              .map(
                (animeModel) => AnimeEntity(
                  imageUrl: animeModel.imageUrl,
                  title: animeModel.title,
                  score: animeModel.score,
                ),
              )
              .toList(),
        );

        return Right(animePaginationEntity);
      } else {
        return const Left(ServerFailure("getTopAnime request error"));
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
