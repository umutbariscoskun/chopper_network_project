import 'package:auto_route/auto_route.dart';
import 'package:chopper_network/features/app/presentation/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: CounterView, initial: true),
    // Diğer rotalarınızı buraya ekleyin
  ],
)
@lazySingleton
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}
