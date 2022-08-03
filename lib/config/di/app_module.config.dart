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
import '../../data/repository/auth/auth_repository_impl.dart' as _i16;
import '../../data/repository/local/local_cache_repository_impl.dart' as _i10;
import '../../data/repository/local/local_database_repository_impl.dart'
    as _i12;
import '../../data/repository/remote/firebase/firebase_repository_impl.dart'
    as _i18;
import '../../domain/repository/auth/auth_repository.dart' as _i15;
import '../../domain/repository/local/local_cache_repository.dart' as _i9;
import '../../domain/repository/local/local_database_repository.dart' as _i11;
import '../../domain/repository/remote/firebase/firebase_repository.dart'
    as _i17;
import '../../domain/usecase/auth/auth_action_usecase.dart' as _i24;
import '../../domain/usecase/auth/auth_state_usecase.dart' as _i23;
import '../../domain/usecase/auth/manage_user_usecase.dart' as _i21;
import '../../domain/usecase/local/database/get_all_stages_usecase.dart'
    as _i20;
import '../../domain/usecase/remote/firebase/firebase_account_usecase.dart'
    as _i19;
import '../../presentation/pages/auth/bloc/auth_bloc.dart' as _i25;
import '../../presentation/pages/auth/signin/bloc/sign_in_bloc.dart' as _i13;
import '../../presentation/pages/auth/signup/bloc/sign_up_bloc.dart' as _i14;
import '../../presentation/pages/chat_detail/bloc/chat_detail_bloc.dart'
    as _i27;
import '../../presentation/pages/main/chat/bloc/chat_bloc.dart' as _i26;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i22;
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
      () => _i7.FirestoreChatServiceImpl(get<_i6.FirestoreBaseService>()));
  gh.lazySingleton<_i8.FirestoreDatabaseService>(
      () => _i8.FirestoreDatabaseServiceImpl(get<_i6.FirestoreBaseService>()));
  gh.lazySingleton<_i9.LocalCacheRepository>(
      () => _i10.LocalCacheRepositoryImpl(get<_i4.AppPreferences>()));
  gh.lazySingleton<_i11.LocalDatabaseRepository>(
      () => _i12.LocalDatabaseRepositoryImpl(get<_i3.AppDatabase>()));
  gh.factory<_i13.SignInBloc>(() => _i13.SignInBloc());
  gh.factory<_i14.SignUpBloc>(() => _i14.SignUpBloc());
  gh.lazySingleton<_i15.AuthRepository>(
      () => _i16.AuthRepositoryImpl(get<_i5.AuthService>()));
  gh.lazySingleton<_i17.FirebaseRepository>(() => _i18.FirebaseRepositoryImpl(
      get<_i8.FirestoreDatabaseService>(), get<_i7.FirestoreChatService>()));
  gh.factory<_i19.GetAccountUseCase>(
      () => _i19.GetAccountUseCase(get<_i17.FirebaseRepository>()));
  gh.factory<_i20.GetAllStagesUseCase>(
      () => _i20.GetAllStagesUseCase(get<_i11.LocalDatabaseRepository>()));
  gh.factory<_i21.GetCurrentUserUseCase>(
      () => _i21.GetCurrentUserUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i22.HomeBloc>(() => _i22.HomeBloc(
      get<_i20.GetAllStagesUseCase>(), get<_i9.LocalCacheRepository>()));
  gh.factory<_i23.OnAuthStateChangesUseCase>(
      () => _i23.OnAuthStateChangesUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i19.SaveAccountUseCase>(
      () => _i19.SaveAccountUseCase(get<_i17.FirebaseRepository>()));
  gh.factory<_i24.SignInWithEmailAndPasswordUseCase>(
      () => _i24.SignInWithEmailAndPasswordUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i24.SignInWithFacebookUseCase>(
      () => _i24.SignInWithFacebookUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i24.SignInWithGoogleUseCase>(
      () => _i24.SignInWithGoogleUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i24.SignOutUseCase>(
      () => _i24.SignOutUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i24.SignUpWithEmailAndPasswordUseCase>(
      () => _i24.SignUpWithEmailAndPasswordUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i25.AuthBloc>(() => _i25.AuthBloc(
      get<_i21.GetCurrentUserUseCase>(),
      get<_i24.SignInWithGoogleUseCase>(),
      get<_i24.SignInWithFacebookUseCase>(),
      get<_i24.SignInWithEmailAndPasswordUseCase>(),
      get<_i24.SignUpWithEmailAndPasswordUseCase>(),
      get<_i24.SignOutUseCase>(),
      get<_i19.SaveAccountUseCase>(),
      get<_i9.LocalCacheRepository>()));
  gh.factory<_i26.ChatBloc>(() => _i26.ChatBloc(
      get<_i17.FirebaseRepository>(), get<_i9.LocalCacheRepository>()));
  gh.factory<_i27.ChatDetailBloc>(
      () => _i27.ChatDetailBloc(get<_i17.FirebaseRepository>()));
  gh.factory<_i19.CheckAccountExistsUseCase>(
      () => _i19.CheckAccountExistsUseCase(get<_i17.FirebaseRepository>()));
  gh.factory<_i28.ProfileBloc>(() => _i28.ProfileBloc(
      get<_i24.SignOutUseCase>(), get<_i9.LocalCacheRepository>()));
  return get;
}

class _$AppModule extends _i29.AppModule {}
