// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/db/app_database.dart' as _i3;
import '../../data/datasource/local/pref/app_preferences.dart' as _i4;
import '../../data/datasource/remote/service/firebase/auth/auth_service.dart'
    as _i5;
import '../../data/datasource/remote/service/firebase/firestore/firestore_base_service.dart'
    as _i6;
import '../../data/datasource/remote/service/firebase/firestore/firestore_chat_service.dart'
    as _i7;
import '../../data/datasource/remote/service/firebase/firestore/firestore_database_service.dart'
    as _i8;
import '../../data/repository/auth/auth_repository_impl.dart' as _i17;
import '../../data/repository/local/local_cache_repository_impl.dart' as _i10;
import '../../data/repository/local/local_database_repository_impl.dart'
    as _i12;
import '../../data/repository/remote/firebase/firebase_repository_impl.dart'
    as _i20;
import '../../domain/repository/auth/auth_repository.dart' as _i16;
import '../../domain/repository/local/local_cache_repository.dart' as _i9;
import '../../domain/repository/local/local_database_repository.dart' as _i11;
import '../../domain/repository/remote/firebase/firebase_repository.dart'
    as _i19;
import '../../domain/usecase/auth/auth_action_usecase.dart' as _i26;
import '../../domain/usecase/auth/auth_state_usecase.dart' as _i25;
import '../../domain/usecase/auth/manage_user_usecase.dart' as _i23;
import '../../domain/usecase/local/cache/cache_account_usecase.dart' as _i13;
import '../../domain/usecase/local/cache/cache_data_usecase.dart' as _i18;
import '../../domain/usecase/local/database/get_all_stages_usecase.dart'
    as _i22;
import '../../domain/usecase/remote/firebase/firebase_user_usecase.dart'
    as _i21;
import '../../presentation/pages/auth/bloc/auth_bloc.dart' as _i27;
import '../../presentation/pages/auth/signin/bloc/sign_in_bloc.dart' as _i14;
import '../../presentation/pages/auth/signup/bloc/sign_up_bloc.dart' as _i15;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i24;
import '../../presentation/pages/profile/bloc/profile_bloc.dart' as _i28;
import 'app_module.dart' as _i29; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final appModule = _$AppModule();
  await gh.lazySingletonAsync<_i3.AppDatabase>(() => appModule.appDatabase,
      preResolve: true);
  gh.lazySingleton<_i4.AppPreferences>(() => _i4.AppPreferencesImpl());
  gh.lazySingleton<_i5.AuthService>(() => _i5.AuthServiceImpl());
  gh.lazySingleton<_i6.FirestoreBaseService>(() => _i6.FirestoreBaseService());
  gh.lazySingleton<_i7.FirestoreChatService>(
      () => _i7.FirestoreChatServiceImpl());
  gh.lazySingleton<_i8.FirestoreDatabaseService>(
      () => _i8.FirestoreDatabaseServiceImpl(get<_i6.FirestoreBaseService>()));
  gh.lazySingleton<_i9.LocalCacheRepository>(
      () => _i10.LocalCacheRepositoryImpl(get<_i4.AppPreferences>()));
  gh.lazySingleton<_i11.LocalDatabaseRepository>(
      () => _i12.LocalDatabaseRepositoryImpl(get<_i3.AppDatabase>()));
  gh.factory<_i13.SaveLocalAccountUseCase>(
      () => _i13.SaveLocalAccountUseCase(get<_i9.LocalCacheRepository>()));
  gh.factory<_i14.SignInBloc>(() => _i14.SignInBloc());
  gh.factory<_i15.SignUpBloc>(() => _i15.SignUpBloc());
  gh.lazySingleton<_i16.AuthRepository>(
      () => _i17.AuthRepositoryImpl(get<_i5.AuthService>()));
  gh.factory<_i18.ClearCacheDataUseCase>(
      () => _i18.ClearCacheDataUseCase(get<_i9.LocalCacheRepository>()));
  gh.lazySingleton<_i19.FirebaseRepository>(
      () => _i20.FirebaseRepositoryImpl(get<_i8.FirestoreDatabaseService>()));
  gh.factory<_i21.GetAccountUseCase>(
      () => _i21.GetAccountUseCase(get<_i19.FirebaseRepository>()));
  gh.factory<_i22.GetAllStagesUseCase>(
      () => _i22.GetAllStagesUseCase(get<_i11.LocalDatabaseRepository>()));
  gh.factory<_i23.GetCurrentUserUseCase>(
      () => _i23.GetCurrentUserUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i13.GetLocalAccountUseCase>(
      () => _i13.GetLocalAccountUseCase(get<_i9.LocalCacheRepository>()));
  gh.factory<_i24.HomeBloc>(() => _i24.HomeBloc(
      get<_i22.GetAllStagesUseCase>(), get<_i13.GetLocalAccountUseCase>()));
  gh.factory<_i25.OnAuthStateChangesUseCase>(
      () => _i25.OnAuthStateChangesUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i21.SaveAccountUseCase>(
      () => _i21.SaveAccountUseCase(get<_i19.FirebaseRepository>()));
  gh.factory<_i26.SignInWithEmailAndPasswordUseCase>(
      () => _i26.SignInWithEmailAndPasswordUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i26.SignInWithFacebookUseCase>(
      () => _i26.SignInWithFacebookUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i26.SignInWithGoogleUseCase>(
      () => _i26.SignInWithGoogleUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i26.SignOutUseCase>(
      () => _i26.SignOutUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i26.SignUpWithEmailAndPasswordUseCase>(
      () => _i26.SignUpWithEmailAndPasswordUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i27.AuthBloc>(() => _i27.AuthBloc(
      get<_i23.GetCurrentUserUseCase>(),
      get<_i26.SignInWithGoogleUseCase>(),
      get<_i26.SignInWithFacebookUseCase>(),
      get<_i26.SignInWithEmailAndPasswordUseCase>(),
      get<_i26.SignUpWithEmailAndPasswordUseCase>(),
      get<_i26.SignOutUseCase>(),
      get<_i21.SaveAccountUseCase>(),
      get<_i13.SaveLocalAccountUseCase>(),
      get<_i18.ClearCacheDataUseCase>()));
  gh.factory<_i21.CheckAccountExistsUseCase>(
      () => _i21.CheckAccountExistsUseCase(get<_i19.FirebaseRepository>()));
  gh.factory<_i28.ProfileBloc>(() => _i28.ProfileBloc(
      get<_i13.GetLocalAccountUseCase>(),
      get<_i26.SignOutUseCase>(),
      get<_i18.ClearCacheDataUseCase>()));
  return get;
}

class _$AppModule extends _i29.AppModule {}
