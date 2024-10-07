part of 'anime_list_cubit.dart';

class AnimeListState extends BaseState {
  const AnimeListState();

  @override
  List<Object> get props => [];
  Widget when({
    required Widget Function() initial,
    required Widget Function() loading,
    required Widget Function(AnimeListLoaded state) loaded,
    required Widget Function(String message) error,
  }) {
    if (this is AnimeListInitial) {
      return initial();
    } else if (this is AnimeListLoading) {
      return loading();
    } else if (this is AnimeListLoaded) {
      return loaded(this as AnimeListLoaded);
    } else if (this is AnimeListError) {
      return error((this as AnimeListError).message);
    } else {
      throw StateError('Unexpected state type');
    }
  }
}

class AnimeListInitial extends AnimeListState {
  const AnimeListInitial();
}

class AnimeListLoading extends AnimeListState {
  const AnimeListLoading();
}

class AnimeListLoaded extends AnimeListState {
  const AnimeListLoaded(this.animeList);
  final List<AnimeEntity> animeList;

  AnimeListLoaded copyWith({
    List<AnimeEntity>? animeList,
  }) {
    return AnimeListLoaded(
      animeList ?? this.animeList,
    );
  }

  @override
  List<Object> get props => [animeList];
}

class AnimeListError extends AnimeListState {
  const AnimeListError({
    required this.message,
  });
  final String message;

  @override
  List<Object> get props => [message];
}
