import 'package:auto_route/auto_route.dart';
import 'package:chopper_network/features/app/domain/entity/anime_entity.dart';
import 'package:chopper_network/features/app/presentation/anime_detail/anime_detail_view.dart';
import 'package:chopper_network/features/app/presentation/anime_list/anime_list_view.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AnimeListView, initial: true),
    AutoRoute(page: AnimeDetailView),

    // Diğer rotalarınızı buraya ekleyin
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}
