import 'package:chopper/chopper.dart';

part 'anime_service.chopper.dart';

@ChopperApi()
abstract class AnimeService extends ChopperService {
  @Get(path: '/anime/{id}/characters')
  Future<Response> getCharacters({
    @Path('id') required int id,
  });

  @Get(path: '/top/anime')
  Future<Response> getTopAnime({
    @Query('page') required int page,
    @Query('limit') int limit = 20,
  });

  static AnimeService create(ChopperClient client) {
    return _$AnimeService(client);
  }
}
