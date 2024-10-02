import 'package:chopper_network/core/config/flavor_config.dart';
import 'package:chopper_network/core/di/inject.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() {
  getIt.init(environment: FlavorConfig.currentFlavor);
}

@module
abstract class RegisterModule {
  // init dio client as module
}
