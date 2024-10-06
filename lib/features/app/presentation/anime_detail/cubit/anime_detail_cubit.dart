import 'dart:async';

import 'package:chopper_network/core/cubit/base_cubit.dart';
import 'package:chopper_network/core/utils/extensions/cubit_extension.dart';
import 'package:chopper_network/features/app/domain/entity/character_entity.dart';
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'anime_detail_state.dart';

@injectable
class AnimeDetailCubit extends BaseCubit<AnimeDetailState> {
  AnimeDetailCubit(
    GetCharactersUseCase getCharactersUseCase, {
    @factoryParam required this.animeId,
  })  : _getCharactersUseCase = getCharactersUseCase,
        super(const AnimeDetailInitial());

  final GetCharactersUseCase _getCharactersUseCase;
  final int animeId;

  @override
  Future<void> onBindingCreated() async {
    await getCharacters();
    super.onBindingCreated();
  }

  Future<List<CharacterEntity>?> performGetCharacterReqeust() async {
    return foldAsync(
      () async => _getCharactersUseCase.call(animeId),
    );
  }

  Future<void> getCharacters() async {
    final result = await performGetCharacterReqeust();
    if (result != null) {
      emit(AnimeDetailLoaded([...result]));
    }
  }
}
