import 'package:chopper_network/core/error/failure.dart';
import 'package:chopper_network/core/usecase/usecase.dart';
import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:chopper_network/features/app/domain/repository/anime_repository.dart';
import 'package:chopper_network/features/app/domain/repository/native_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable

///Get Characters
class GetCharactersUseCase extends UseCase<List<CharacterEntity>, int> {
  GetCharactersUseCase(
    this._animeRepository,
    this._nativeRepository,
  );
  final AnimeRepository _animeRepository;
  final NativeRepository _nativeRepository;

  @override
  Future<Either<Failure, List<CharacterEntity>>> call(int param) async {
    final networkChannelResult = await _nativeRepository.getNetworkStatus();
    return networkChannelResult.fold(
      (l) => const Left(ServerFailure('Channel Connection Error')),
      (networkStatus) {
        if (!networkStatus) {
          return const Left(ServerFailure('Network Connection Error'));
        }
        return _animeRepository.getCharacters(id: param);
      },
    );
  }
}
