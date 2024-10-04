import 'package:bloc/bloc.dart';
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart';
import 'package:chopper_network/features/app/domain/use_case/get_top_anime_use_case.dart';
import 'package:injectable/injectable.dart';

@injectable
class CounterCubit extends Cubit<int> {
  CounterCubit(
    GetTopAnimeUseCase getTopAnimeUseCase,
    GetCharactersUseCase getCharactersUseCase,
  )   : _getTopAnimeUseCase = getTopAnimeUseCase,
        _getCharactersUseCase = getCharactersUseCase,
        super(0);
  final GetTopAnimeUseCase _getTopAnimeUseCase;
  final GetCharactersUseCase _getCharactersUseCase;

  Future<void> increment() async {
    final fold = await _getTopAnimeUseCase.call(1);
    fold.fold((l) {
      print(l);
    }, (r) {
      print(r);
    });
    emit(state + 1);
  }

  Future<void> decrement() async {
    final fold = await _getCharactersUseCase.call(52991);
    fold.fold((l) {
      print(l);
    }, (r) {
      print(r);
    });
    emit(state - 1);
  }
}
