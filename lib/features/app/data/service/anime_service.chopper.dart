// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AnimeService extends AnimeService {
  _$AnimeService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AnimeService;

  @override
  Future<Response<dynamic>> getCharacters({required int id}) {
    final Uri $url = Uri.parse('/anime/${id}/characters');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getTopAnime({
    required int page,
    int limit = 20,
  }) {
    final Uri $url = Uri.parse('/top/anime');
    final Map<String, dynamic> $params = <String, dynamic>{
      'page': page,
      'limit': limit,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}