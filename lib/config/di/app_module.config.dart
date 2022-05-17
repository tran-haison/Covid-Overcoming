// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../core/service/auth.dart' as _i5;
import '../../data/datasource/local/db/app_database.dart' as _i3;
import '../../data/datasource/local/local_datasource.dart' as _i9;
import '../../data/datasource/local/pref/app_pref.dart' as _i4;
import '../../data/repository/auth/auth_repository_impl.dart' as _i7;
import '../../data/repository/local/local_repository_impl.dart' as _i11;
import '../../domain/repository/auth/auth_repository.dart' as _i6;
import '../../domain/repository/local/local_repository.dart' as _i10;
import '../../domain/usecase/auth/get_current_user_usecase.dart' as _i8;
import '../../domain/usecase/auth/sign_in_with_email_and_password_usecase.dart'
    as _i13;
import '../../domain/usecase/auth/sign_up_with_email_and_password_usecase.dart'
    as _i15;
import '../../domain/usecase/local/get_all_stages_usecase.dart' as _i17;
import '../../presentation/pages/auth/bloc/auth_bloc.dart' as _i16;
import '../../presentation/pages/auth/signin/bloc/sign_in_bloc.dart' as _i12;
import '../../presentation/pages/auth/signup/bloc/sign_up_bloc.dart' as _i14;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i18;
import 'app_module.dart' as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.lazySingletonAsync<_i3.AppDatabase>(() => appModule.appDatabase,
      preResolve: true);
  gh.lazySingleton<_i4.AppPref>(() => _i4.AppPrefImpl());
  gh.lazySingleton<_i5.Auth>(() => _i5.AuthImpl());
  gh.lazySingleton<_i6.AuthRepository>(
      () => _i7.AuthRepositoryImpl(get<_i5.Auth>()));
  gh.factory<_i8.GetCurrentUserUseCase>(
      () => _i8.GetCurrentUserUseCase(get<_i6.AuthRepository>()));
  gh.lazySingleton<_i9.LocalDatasource>(() =>
      _i9.LocalDatasourceImpl(get<_i3.AppDatabase>(), get<_i4.AppPref>()));
  gh.lazySingleton<_i10.LocalRepository>(
      () => _i11.LocalRepositoryImpl(get<_i9.LocalDatasource>()));
  gh.factory<_i12.SignInBloc>(() => _i12.SignInBloc());
  gh.factory<_i13.SignInWithEmailAndPasswordUseCase>(
      () => _i13.SignInWithEmailAndPasswordUseCase(get<_i6.AuthRepository>()));
  gh.factory<_i14.SignUpBloc>(() => _i14.SignUpBloc());
  gh.factory<_i15.SignUpWithEmailAndPasswordUseCase>(
      () => _i15.SignUpWithEmailAndPasswordUseCase(get<_i6.AuthRepository>()));
  gh.factory<_i16.AuthBloc>(() => _i16.AuthBloc(
      get<_i8.GetCurrentUserUseCase>(),
      get<_i13.SignInWithEmailAndPasswordUseCase>(),
      get<_i15.SignUpWithEmailAndPasswordUseCase>()));
  gh.factory<_i17.GetAllStagesUseCase>(
      () => _i17.GetAllStagesUseCase(get<_i10.LocalRepository>()));
  gh.factory<_i18.HomeBloc>(
      () => _i18.HomeBloc(get<_i17.GetAllStagesUseCase>()));
  return get;
}

class _$AppModule extends _i19.AppModule {}
