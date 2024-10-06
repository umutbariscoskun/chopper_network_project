part of 'anime_detail_cubit.dart';

class AnimeDetailState extends BaseState {
  const AnimeDetailState();

  @override
  List<Object> get props => [];
  Widget when({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AnimeDetailLoaded state) loaded,
    required Widget Function(String message) error,
  }) {
    if (this is AnimeDetailInitial) {
      return initial();
    } else if (this is AnimeDetailLoading) {
      return loading();
    } else if (this is AnimeDetailLoaded) {
      return loaded(this as AnimeDetailLoaded);
    } else if (this is AnimeDetailError) {
      return error((this as AnimeDetailError).message);
    } else {
      throw StateError('Unexpected state type');
    }
  }
}

class AnimeDetailInitial extends AnimeDetailState {
  const AnimeDetailInitial();
}

class AnimeDetailLoading extends AnimeDetailState {
  const AnimeDetailLoading();
}

class AnimeDetailLoaded extends AnimeDetailState {
  const AnimeDetailLoaded(this.characterList);
  final List<CharacterEntity> characterList;

  AnimeDetailLoaded copyWith({
    List<CharacterEntity>? characterList,
  }) {
    return AnimeDetailLoaded(
      characterList ?? this.characterList,
    );
  }

  @override
  List<Object> get props => [characterList];
}

class AnimeDetailError extends AnimeDetailState {
  const AnimeDetailError({
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [message];
}
