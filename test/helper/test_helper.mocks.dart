// Mocks generated by Mockito 5.4.0 from annotations
// in chopper_network/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:chopper/chopper.dart' as _i2;
import 'package:chopper_network/core/error/failure.dart' as _i7;
import 'package:chopper_network/features/app/data/service/anime_service.dart'
    as _i4;
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart'
    as _i10;
import 'package:chopper_network/features/app/domain/entity/character_entity.dart'
    as _i8;
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart'
    as _i6;
import 'package:chopper_network/features/app/domain/use_case/get_top_anime_use_case.dart'
    as _i9;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeChopperClient_0 extends _i1.SmartFake implements _i2.ChopperClient {
  _FakeChopperClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeType_1 extends _i1.SmartFake implements Type {
  _FakeType_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2<BodyType> extends _i1.SmartFake
    implements _i2.Response<BodyType> {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_3<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AnimeService].
///
/// See the documentation for Mockito's code generation for more information.
class MockAnimeService extends _i1.Mock implements _i4.AnimeService {
  MockAnimeService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.ChopperClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeChopperClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.ChopperClient);

  @override
  set client(_i2.ChopperClient? _client) => super.noSuchMethod(
        Invocation.setter(
          #client,
          _client,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Type get definitionType => (super.noSuchMethod(
        Invocation.getter(#definitionType),
        returnValue: _FakeType_1(
          this,
          Invocation.getter(#definitionType),
        ),
      ) as Type);

  @override
  _i5.Future<_i2.Response<dynamic>> getCharacters({required int? id}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getCharacters,
          [],
          {#id: id},
        ),
        returnValue:
            _i5.Future<_i2.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #getCharacters,
            [],
            {#id: id},
          ),
        )),
      ) as _i5.Future<_i2.Response<dynamic>>);

  @override
  _i5.Future<_i2.Response<dynamic>> getTopAnime({
    required int? page,
    int? limit = 20,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopAnime,
          [],
          {
            #page: page,
            #limit: limit,
          },
        ),
        returnValue:
            _i5.Future<_i2.Response<dynamic>>.value(_FakeResponse_2<dynamic>(
          this,
          Invocation.method(
            #getTopAnime,
            [],
            {
              #page: page,
              #limit: limit,
            },
          ),
        )),
      ) as _i5.Future<_i2.Response<dynamic>>);
}

/// A class which mocks [GetCharactersUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetCharactersUseCase extends _i1.Mock
    implements _i6.GetCharactersUseCase {
  MockGetCharactersUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i7.Failure, List<_i8.CharacterEntity>>> call(
          int? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i5.Future<
                _i3.Either<_i7.Failure, List<_i8.CharacterEntity>>>.value(
            _FakeEither_3<_i7.Failure, List<_i8.CharacterEntity>>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i7.Failure, List<_i8.CharacterEntity>>>);
}

/// A class which mocks [GetTopAnimeUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetTopAnimeUseCase extends _i1.Mock
    implements _i9.GetTopAnimeUseCase {
  MockGetTopAnimeUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Either<_i7.Failure, _i10.AnimePaginationEntity>> call(
          int? param) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [param],
        ),
        returnValue: _i5.Future<
                _i3.Either<_i7.Failure, _i10.AnimePaginationEntity>>.value(
            _FakeEither_3<_i7.Failure, _i10.AnimePaginationEntity>(
          this,
          Invocation.method(
            #call,
            [param],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i7.Failure, _i10.AnimePaginationEntity>>);
}
