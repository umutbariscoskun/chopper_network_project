import 'package:chopper/chopper.dart';
import 'package:chopper_network/core/config/flavor_config.dart';
import 'package:chopper_network/core/di/inject.config.dart';
import 'package:chopper_network/features/app/data/service/anime_service.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init(environment: FlavorConfig.currentFlavor);
}

@module
abstract class RegisterModule {
  @singleton
  ChopperClient get chopperClient => ChopperClient(
        baseUrl: Uri.parse('https://api.jikan.moe/v4'),
        interceptors: [
          HttpLoggingInterceptor(),
        ],
        converter: const JsonConverter(),
      );

  @singleton
  AnimeService get animeService => AnimeService.create(chopperClient);
}
