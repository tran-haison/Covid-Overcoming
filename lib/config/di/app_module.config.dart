// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/db/app_database.dart' as _i3;
import '../../data/datasource/local/local_datasource.dart' as _i7;
import '../../data/datasource/local/pref/app_pref.dart' as _i4;
import '../../data/datasource/remote/service/firebase/auth_service.dart' as _i5;
import '../../data/datasource/remote/service/firebase/firestore_service.dart'
    as _i6;
import '../../data/repository/auth/auth_repository_impl.dart' as _i13;
import '../../data/repository/local/local_repository_impl.dart' as _i9;
import '../../domain/repository/auth/auth_repository.dart' as _i12;
import '../../domain/repository/local/local_repository.dart' as _i8;
import '../../domain/usecase/auth/get_current_user_usecase.dart' as _i15;
import '../../domain/usecase/auth/on_auth_state_changes_usecase.dart' as _i17;
import '../../domain/usecase/auth/sign_in_with_email_and_password_usecase.dart'
    as _i18;
import '../../domain/usecase/auth/sign_in_with_facebook_usecase.dart' as _i19;
import '../../domain/usecase/auth/sign_in_with_google_usecase.dart' as _i20;
import '../../domain/usecase/auth/sign_out_usecase.dart' as _i21;
import '../../domain/usecase/auth/sign_up_with_email_and_password_usecase.dart'
    as _i22;
import '../../domain/usecase/local/get_all_stages_usecase.dart' as _i14;
import '../../presentation/pages/auth/bloc/auth_bloc.dart' as _i23;
import '../../presentation/pages/auth/signin/bloc/sign_in_bloc.dart' as _i10;
import '../../presentation/pages/auth/signup/bloc/sign_up_bloc.dart' as _i11;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i16;
import 'app_module.dart' as _i24; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.lazySingletonAsync<_i3.AppDatabase>(() => appModule.appDatabase,
      preResolve: true);
  gh.lazySingleton<_i4.AppPref>(() => _i4.AppPrefImpl());
  gh.lazySingleton<_i5.AuthService>(() => _i5.AuthServiceImpl());
  gh.lazySingleton<_i6.FirestoreService>(() => _i6.FirestoreServiceImpl());
  gh.lazySingleton<_i7.LocalDatasource>(() =>
      _i7.LocalDatasourceImpl(get<_i3.AppDatabase>(), get<_i4.AppPref>()));
  gh.lazySingleton<_i8.LocalRepository>(
      () => _i9.LocalRepositoryImpl(get<_i7.LocalDatasource>()));
  gh.factory<_i10.SignInBloc>(() => _i10.SignInBloc());
  gh.factory<_i11.SignUpBloc>(() => _i11.SignUpBloc());
  gh.lazySingleton<_i12.AuthRepository>(
      () => _i13.AuthRepositoryImpl(get<_i5.AuthService>()));
  gh.factory<_i14.GetAllStagesUseCase>(
      () => _i14.GetAllStagesUseCase(get<_i8.LocalRepository>()));
  gh.factory<_i15.GetCurrentUserUseCase>(
      () => _i15.GetCurrentUserUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i16.HomeBloc>(
      () => _i16.HomeBloc(get<_i14.GetAllStagesUseCase>()));
  gh.factory<_i17.OnAuthStateChangesUseCase>(
      () => _i17.OnAuthStateChangesUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i18.SignInWithEmailAndPasswordUseCase>(
      () => _i18.SignInWithEmailAndPasswordUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i19.SignInWithFacebookUseCase>(
      () => _i19.SignInWithFacebookUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i20.SignInWithGoogleUseCase>(
      () => _i20.SignInWithGoogleUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i21.SignOutUseCase>(
      () => _i21.SignOutUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i22.SignUpWithEmailAndPasswordUseCase>(
      () => _i22.SignUpWithEmailAndPasswordUseCase(get<_i12.AuthRepository>()));
  gh.factory<_i23.AuthBloc>(() => _i23.AuthBloc(
      get<_i17.OnAuthStateChangesUseCase>(),
      get<_i15.GetCurrentUserUseCase>(),
      get<_i20.SignInWithGoogleUseCase>(),
      get<_i19.SignInWithFacebookUseCase>(),
      get<_i18.SignInWithEmailAndPasswordUseCase>(),
      get<_i22.SignUpWithEmailAndPasswordUseCase>(),
      get<_i21.SignOutUseCase>()));
  return get;
}

class _$AppModule extends _i24.AppModule {}
