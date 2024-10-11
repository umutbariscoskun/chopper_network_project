// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chopper/chopper.dart' as _i5;
import 'package:chopper_network/core/di/inject.dart' as _i14;
import 'package:chopper_network/core/routers/app_router.dart' as _i4;
import 'package:chopper_network/features/app/data/repository/anime_repository_impl.dart'
    as _i9;
import 'package:chopper_network/features/app/data/repository/native_repository_impl.dart'
    as _i7;
import 'package:chopper_network/features/app/data/service/anime_service.dart'
    as _i3;
import 'package:chopper_network/features/app/domain/repository/anime_repository.dart'
    as _i8;
import 'package:chopper_network/features/app/domain/repository/native_repository.dart'
    as _i6;
import 'package:chopper_network/features/app/domain/use_case/get_characters_use_case.dart'
    as _i10;
import 'package:chopper_network/features/app/domain/use_case/get_top_anime_use_case.dart'
    as _i11;
import 'package:chopper_network/features/app/presentation/anime_detail/cubit/anime_detail_cubit.dart'
    as _i12;
import 'package:chopper_network/features/app/presentation/anime_list/cubit/anime_list_cubit.dart'
    as _i13;
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
    gh.factory<_i6.NativeRepository>(() => _i7.NativeRepositoryImpl());
    gh.factory<_i8.AnimeRepository>(
        () => _i9.AnimeRepositoryImpl(gh<_i3.AnimeService>()));
    gh.factory<_i10.GetCharactersUseCase>(() => _i10.GetCharactersUseCase(
          gh<_i8.AnimeRepository>(),
          gh<_i6.NativeRepository>(),
        ));
    gh.factory<_i11.GetTopAnimeUseCase>(() => _i11.GetTopAnimeUseCase(
          gh<_i8.AnimeRepository>(),
          gh<_i6.NativeRepository>(),
        ));
    gh.factoryParam<_i12.AnimeDetailCubit, int, dynamic>((
      animeId,
      _,
    ) =>
        _i12.AnimeDetailCubit(
          gh<_i10.GetCharactersUseCase>(),
          animeId: animeId,
        ));
    gh.factory<_i13.AnimeListCubit>(
        () => _i13.AnimeListCubit(gh<_i11.GetTopAnimeUseCase>()));
    return this;
  }
}

class _$RegisterModule extends _i14.RegisterModule {}
