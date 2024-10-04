// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i5;
import 'package:chopper_network/core/di/inject.dart' as _i11;
import 'package:chopper_network/core/routers/app_router.dart' as _i4;
import 'package:chopper_network/features/app/data/repository/anime_repository_impl.dart'
    as _i7;
import 'package:chopper_network/features/app/data/service/anime_service.dart'
    as _i3;
import 'package:chopper_network/features/app/domain/repository/anime_repository.dart'
    as _i6;
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart'
    as _i8;
import 'package:chopper_network/features/app/domain/use_case/get_top_anime_use_case.dart'
    as _i9;
import 'package:chopper_network/features/app/presentation/counter/cubit/counter_cubit.dart'
    as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.AnimeService>(registerModule.animeService);
    gh.lazySingleton<_i4.AppRouter>(() => _i4.AppRouter());
    gh.singleton<_i5.ChopperClient>(registerModule.chopperClient);
    gh.factory<_i6.AnimeRepository>(
        () => _i7.AnimeRepositoryImpl(gh<_i3.AnimeService>()));
    gh.factory<_i8.GetCharactersUseCase>(
        () => _i8.GetCharactersUseCase(gh<_i6.AnimeRepository>()));
    gh.factory<_i9.GetTopAnimeUseCase>(
        () => _i9.GetTopAnimeUseCase(gh<_i6.AnimeRepository>()));
    gh.factory<_i10.CounterCubit>(() => _i10.CounterCubit(
          gh<_i9.GetTopAnimeUseCase>(),
          gh<_i8.GetCharactersUseCase>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
