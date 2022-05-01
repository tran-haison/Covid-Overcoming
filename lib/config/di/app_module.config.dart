// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/db/app_database.dart' as _i3;
import '../../data/datasource/local/local_datasource.dart' as _i5;
import '../../data/datasource/local/pref/app_pref.dart' as _i4;
import '../../data/repository/local/local_repository_impl.dart' as _i7;
import '../../domain/repository/local/local_repository.dart' as _i6;
import '../../domain/usecase/local/get_all_stages_usecase.dart' as _i8;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i9;
import 'app_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.lazySingletonAsync<_i3.AppDatabase>(() => appModule.appDatabase,
      preResolve: true);
  gh.lazySingleton<_i4.AppPref>(() => _i4.AppPrefImpl());
  gh.lazySingleton<_i5.LocalDatasource>(() =>
      _i5.LocalDatasourceImpl(get<_i3.AppDatabase>(), get<_i4.AppPref>()));
  gh.lazySingleton<_i6.LocalRepository>(
      () => _i7.LocalRepositoryImpl(get<_i5.LocalDatasource>()));
  gh.lazySingleton<_i8.GetAllStagesUseCase>(
      () => _i8.GetAllStagesUseCase(get<_i6.LocalRepository>()));
  gh.factory<_i9.HomeBloc>(() => _i9.HomeBloc(get<_i8.GetAllStagesUseCase>()));
  return get;
}

class _$AppModule extends _i10.AppModule {}
