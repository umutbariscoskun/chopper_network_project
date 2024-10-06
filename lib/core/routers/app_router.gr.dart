// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    AnimeListRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeListRouteArgs>(
          orElse: () => const AnimeListRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AnimeListView(key: args.key),
      );
    },
    CounterRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CounterView(),
      );
    },
    AnimeDetailRoute.name: (routeData) {
      final args = routeData.argsAs<AnimeDetailRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AnimeDetailView(
          anime: args.anime,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          AnimeListRoute.name,
          path: '/',
        ),
        RouteConfig(
          CounterRoute.name,
          path: '/counter-view',
        ),
        RouteConfig(
          AnimeDetailRoute.name,
          path: '/anime-detail-view',
        ),
      ];
}

/// generated route for
/// [AnimeListView]
class AnimeListRoute extends PageRouteInfo<AnimeListRouteArgs> {
  AnimeListRoute({Key? key})
      : super(
          AnimeListRoute.name,
          path: '/',
          args: AnimeListRouteArgs(key: key),
        );

  static const String name = 'AnimeListRoute';
}

class AnimeListRouteArgs {
  const AnimeListRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AnimeListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [CounterView]
class CounterRoute extends PageRouteInfo<void> {
  const CounterRoute()
      : super(
          CounterRoute.name,
          path: '/counter-view',
        );

  static const String name = 'CounterRoute';
}

/// generated route for
/// [AnimeDetailView]
class AnimeDetailRoute extends PageRouteInfo<AnimeDetailRouteArgs> {
  AnimeDetailRoute({
    required AnimeEntity anime,
    Key? key,
  }) : super(
          AnimeDetailRoute.name,
          path: '/anime-detail-view',
          args: AnimeDetailRouteArgs(
            anime: anime,
            key: key,
          ),
        );

  static const String name = 'AnimeDetailRoute';
}

class AnimeDetailRouteArgs {
  const AnimeDetailRouteArgs({
    required this.anime,
    this.key,
  });

  final AnimeEntity anime;

  final Key? key;

  @override
  String toString() {
    return 'AnimeDetailRouteArgs{anime: $anime, key: $key}';
  }
}
