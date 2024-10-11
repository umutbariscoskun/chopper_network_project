import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:chopper_network/features/app/domain/repository/anime_repository.dart';
import 'package:chopper_network/features/app/domain/repository/native_repository.dart';
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'use_case_mock_gen_test.mocks.dart';

void main() {
  GetCharactersUseCase? usecase;
  AnimeRepository? mockRepo;
  NativeRepository? mockNativeRepo;

  CharacterEntity? entity;

  setUp(() {
    mockRepo = FakeRepo();
    mockNativeRepo = MockNativeRepository();
    usecase = GetCharactersUseCase(
      mockRepo!,
      mockNativeRepo!,
    );

    entity = CharacterEntity(
      name: 'name',
      imageUrl: 'imageUrl.jpg',
      role: 'role',
    );
  });

  test(
    'should GET anime pagination entity from the repository',
    () async {
      when(mockNativeRepo!.getNetworkStatus())
          .thenAnswer((_) async => const Right(true));
      when(mockRepo!.getCharacters(id: 1))
          .thenAnswer((_) async => Right([entity!]));

      final testResult = await usecase!(1);
      testResult
        ..fold((l) => null, (r) {
          //check name
          expect(entity!.name, r.first.name);
        })
        ..fold((l) => null, (r) {
          expect(r, [entity]);
        });
    },
  );
}
