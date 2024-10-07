import 'package:chopper_network/core/error/failure.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<CharacterEntity>>> getCharacters({
    required int id,
  });

  Future<Either<Failure, AnimePaginationEntity>> getTopAnime({
    required int page,
  });
}
