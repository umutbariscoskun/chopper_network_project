import 'package:chopper_network/core/error/failure.dart';
import 'package:chopper_network/core/usecase/usecase.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:chopper_network/features/app/domain/repository/anime_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable

///Get Characters
class GetCharactersUseCase extends UseCase<List<CharacterEntity>, int> {
  GetCharactersUseCase(this._animeRepository);
  final AnimeRepository _animeRepository;

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(int param) {
    return _animeRepository.getCharacters(id: param);
  }
}
