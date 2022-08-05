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
    as _i7;
import '../../data/datasource/remote/service/firebase/firestore/firestore_chat_service.dart'
    as _i8;
import '../../data/datasource/remote/service/firebase/firestore/firestore_database_service.dart'
    as _i9;
import '../../data/repository/auth/auth_repository_impl.dart' as _i17;
import '../../data/repository/local/local_cache_repository_impl.dart' as _i11;
import '../../data/repository/local/local_database_repository_impl.dart'
    as _i13;
import '../../data/repository/remote/firebase/firebase_repository_impl.dart'
    as _i19;
import '../../domain/repository/auth/auth_repository.dart' as _i16;
import '../../domain/repository/local/local_cache_repository.dart' as _i10;
import '../../domain/repository/local/local_database_repository.dart' as _i12;
import '../../domain/repository/remote/firebase/firebase_repository.dart'
    as _i18;
import '../../domain/usecase/auth/auth_action_usecase.dart' as _i25;
import '../../domain/usecase/auth/auth_state_usecase.dart' as _i24;
import '../../domain/usecase/auth/manage_user_usecase.dart' as _i22;
import '../../domain/usecase/local/database/get_all_stages_usecase.dart'
    as _i21;
import '../../domain/usecase/remote/firebase/firebase_account_usecase.dart'
    as _i20;
import '../../presentation/pages/auth/bloc/auth_bloc.dart' as _i26;
import '../../presentation/pages/auth/signin/bloc/sign_in_bloc.dart' as _i14;
import '../../presentation/pages/auth/signup/bloc/sign_up_bloc.dart' as _i15;
import '../../presentation/pages/chat_detail/bloc/chat_detail_bloc.dart'
    as _i28;
import '../../presentation/pages/examination/bloc/examination_bloc.dart' as _i6;
import '../../presentation/pages/main/chat/bloc/chat_bloc.dart' as _i27;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i23;
import '../../presentation/pages/profile/bloc/profile_bloc.dart' as _i29;
import 'app_module.dart' as _i30; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i6.ExaminationBloc>(() => _i6.ExaminationBloc());
  gh.lazySingleton<_i7.FirestoreBaseService>(() => _i7.FirestoreBaseService());
  gh.lazySingleton<_i8.FirestoreChatService>(
      () => _i8.FirestoreChatServiceImpl(get<_i7.FirestoreBaseService>()));
  gh.lazySingleton<_i9.FirestoreDatabaseService>(
      () => _i9.FirestoreDatabaseServiceImpl(get<_i7.FirestoreBaseService>()));
  gh.lazySingleton<_i10.LocalCacheRepository>(
      () => _i11.LocalCacheRepositoryImpl(get<_i4.AppPreferences>()));
  gh.lazySingleton<_i12.LocalDatabaseRepository>(
      () => _i13.LocalDatabaseRepositoryImpl(get<_i3.AppDatabase>()));
  gh.factory<_i14.SignInBloc>(() => _i14.SignInBloc());
  gh.factory<_i15.SignUpBloc>(() => _i15.SignUpBloc());
  gh.lazySingleton<_i16.AuthRepository>(
      () => _i17.AuthRepositoryImpl(get<_i5.AuthService>()));
  gh.lazySingleton<_i18.FirebaseRepository>(() => _i19.FirebaseRepositoryImpl(
      get<_i9.FirestoreDatabaseService>(), get<_i8.FirestoreChatService>()));
  gh.factory<_i20.GetAccountUseCase>(
      () => _i20.GetAccountUseCase(get<_i18.FirebaseRepository>()));
  gh.factory<_i21.GetAllStagesUseCase>(
      () => _i21.GetAllStagesUseCase(get<_i12.LocalDatabaseRepository>()));
  gh.factory<_i22.GetCurrentUserUseCase>(
      () => _i22.GetCurrentUserUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i23.HomeBloc>(() => _i23.HomeBloc(
      get<_i21.GetAllStagesUseCase>(), get<_i10.LocalCacheRepository>()));
  gh.factory<_i24.OnAuthStateChangesUseCase>(
      () => _i24.OnAuthStateChangesUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i20.SaveAccountUseCase>(
      () => _i20.SaveAccountUseCase(get<_i18.FirebaseRepository>()));
  gh.factory<_i25.SignInWithEmailAndPasswordUseCase>(
      () => _i25.SignInWithEmailAndPasswordUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i25.SignInWithFacebookUseCase>(
      () => _i25.SignInWithFacebookUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i25.SignInWithGoogleUseCase>(
      () => _i25.SignInWithGoogleUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i25.SignOutUseCase>(
      () => _i25.SignOutUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i25.SignUpWithEmailAndPasswordUseCase>(
      () => _i25.SignUpWithEmailAndPasswordUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i26.AuthBloc>(() => _i26.AuthBloc(
      get<_i22.GetCurrentUserUseCase>(),
      get<_i25.SignInWithGoogleUseCase>(),
      get<_i25.SignInWithFacebookUseCase>(),
      get<_i25.SignInWithEmailAndPasswordUseCase>(),
      get<_i25.SignUpWithEmailAndPasswordUseCase>(),
      get<_i25.SignOutUseCase>(),
      get<_i20.SaveAccountUseCase>(),
      get<_i20.GetAccountUseCase>(),
      get<_i10.LocalCacheRepository>()));
  gh.factory<_i27.ChatBloc>(() => _i27.ChatBloc(
      get<_i18.FirebaseRepository>(), get<_i10.LocalCacheRepository>()));
  gh.factory<_i28.ChatDetailBloc>(
      () => _i28.ChatDetailBloc(get<_i18.FirebaseRepository>()));
  gh.factory<_i20.CheckAccountExistsUseCase>(
      () => _i20.CheckAccountExistsUseCase(get<_i18.FirebaseRepository>()));
  gh.factory<_i29.ProfileBloc>(() => _i29.ProfileBloc(
      get<_i20.SaveAccountUseCase>(),
      get<_i25.SignOutUseCase>(),
      get<_i10.LocalCacheRepository>()));
  return get;
}

class _$AppModule extends _i30.AppModule {}
