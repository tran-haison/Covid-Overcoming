// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/db/app_database.dart' as _i3;
import '../../data/datasource/local/local_datasource.dart' as _i4;
import '../../data/repository/local/local_repository_impl.dart' as _i6;
import '../../domain/repository/local/local_repository.dart' as _i5;
import '../../domain/usecase/local/get_all_stages_usecase.dart' as _i7;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i8;
import 'app_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.lazySingletonAsync<_i3.AppDatabase>(() => appModule.appDatabase,
      preResolve: true);
  gh.lazySingleton<_i4.LocalDatasource>(
      () => _i4.LocalDatasourceImpl(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i5.LocalRepository>(
      () => _i6.LocalRepositoryImpl(get<_i4.LocalDatasource>()));
  gh.lazySingleton<_i7.GetAllStagesUseCase>(
      () => _i7.GetAllStagesUseCase(get<_i5.LocalRepository>()));
  gh.factory<_i8.HomeBloc>(() => _i8.HomeBloc(get<_i7.GetAllStagesUseCase>()));
  return get;
}

class _$AppModule extends _i9.AppModule {}
