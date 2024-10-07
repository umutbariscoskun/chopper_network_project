import 'package:bloc_test/bloc_test.dart';
import 'package:chopper_network/core/error/failure.dart';
import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart';
import 'package:chopper_network/features/app/presentation/anime_detail/cubit/anime_detail_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../helper/test_helper.mocks.dart';

void main() {
  late AnimeDetailCubit cubit;
  late MockGetCharactersUseCase mockGetCharactersUseCase;

  setUp(() {
    mockGetCharactersUseCase = MockGetCharactersUseCase();
    cubit = AnimeDetailCubit(mockGetCharactersUseCase, animeId: 1);
  });

  group('AnimeDetailCubit', () {
    test('initial state is AnimeDetailInitial', () {
      expect(cubit.state, equals(const AnimeDetailInitial()));
    });

    blocTest<AnimeDetailCubit, AnimeDetailState>(
      'emits [AnimeDetailLoaded] when getCharacters succeeds',
      build: () {
        when(mockGetCharactersUseCase.call(any)).thenAnswer((_) async => Right([
              CharacterEntity(
                name: 'test1',
                imageUrl: 'imageUrl',
                role: 'role',
              ),
              CharacterEntity(
                name: 'test2',
                imageUrl: 'imageUrl',
                role: 'role',
              ),
              CharacterEntity(
                name: 'test3',
                imageUrl: 'imageUrl',
                role: 'role',
              ),
            ]));
        return cubit;
      },
      act: (cubit) => cubit.getCharacters(),
      expect: () => [
        isA<AnimeDetailLoaded>(),
      ],
      verify: (cubit) {
        verify(mockGetCharactersUseCase.call(1)).called(1);
        var state = cubit.state as AnimeDetailLoaded;
        expect(state.characterList.length, 3);
        expect(state.characterList[0].name, 'test1');
        expect(state.characterList[1].name, 'test2');
        expect(state.characterList[2].name, 'test3');
      },
    );

    blocTest<AnimeDetailCubit, AnimeDetailState>(
      'emits [AnimeDetailError] when getCharacters fails',
      build: () {
        when(mockGetCharactersUseCase.call(any))
            .thenAnswer((_) async => const Left(ServerFailure('')));
        return cubit;
      },
      act: (cubit) => cubit.getCharacters(),
      expect: () => [
        isA<AnimeDetailError>(),
      ],
      verify: (cubit) {
        verify(mockGetCharactersUseCase.call(1)).called(1);
      },
    );
  });
}
