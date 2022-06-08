// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/datasource/local/db/app_database.dart' as _i3;
import '../../data/datasource/local/local_datasource.dart' as _i9;
import '../../data/datasource/local/pref/app_pref.dart' as _i4;
import '../../data/datasource/remote/service/firebase/auth/auth_service.dart'
    as _i5;
import '../../data/datasource/remote/service/firebase/firestore/firestore_base_service.dart'
    as _i6;
import '../../data/datasource/remote/service/firebase/firestore/firestore_chat_service.dart'
    as _i7;
import '../../data/datasource/remote/service/firebase/firestore/firestore_database_service.dart'
    as _i8;
import '../../data/repository/auth/auth_repository_impl.dart' as _i15;
import '../../data/repository/local/local_repository_impl.dart' as _i11;
import '../../data/repository/remote/firebase/firebase_repository_impl.dart'
    as _i17;
import '../../domain/repository/auth/auth_repository.dart' as _i14;
import '../../domain/repository/local/local_repository.dart' as _i10;
import '../../domain/repository/remote/firebase/firebase_repository.dart'
    as _i16;
import '../../domain/usecase/auth/get_current_user_usecase.dart' as _i19;
import '../../domain/usecase/auth/on_auth_state_changes_usecase.dart' as _i22;
import '../../domain/usecase/auth/sign_in_with_email_and_password_usecase.dart'
    as _i23;
import '../../domain/usecase/auth/sign_in_with_facebook_usecase.dart' as _i24;
import '../../domain/usecase/auth/sign_in_with_google_usecase.dart' as _i25;
import '../../domain/usecase/auth/sign_out_usecase.dart' as _i26;
import '../../domain/usecase/auth/sign_up_with_email_and_password_usecase.dart'
    as _i27;
import '../../domain/usecase/local/get_all_stages_usecase.dart' as _i18;
import '../../domain/usecase/remote/firebase/firebase_user_usecase.dart'
    as _i20;
import '../../presentation/pages/auth/bloc/auth_bloc.dart' as _i28;
import '../../presentation/pages/auth/signin/bloc/sign_in_bloc.dart' as _i12;
import '../../presentation/pages/auth/signup/bloc/sign_up_bloc.dart' as _i13;
import '../../presentation/pages/main/home/bloc/home_bloc.dart' as _i21;
import 'app_module.dart' as _i29; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingleton<_i6.FirestoreBaseService>(() => _i6.FirestoreBaseService());
  gh.lazySingleton<_i7.FirestoreChatService>(
      () => _i7.FirestoreChatServiceImpl());
  gh.lazySingleton<_i8.FirestoreDatabaseService>(
      () => _i8.FirestoreDatabaseServiceImpl(get<_i6.FirestoreBaseService>()));
  gh.lazySingleton<_i9.LocalDatasource>(() =>
      _i9.LocalDatasourceImpl(get<_i3.AppDatabase>(), get<_i4.AppPref>()));
  gh.lazySingleton<_i10.LocalRepository>(
      () => _i11.LocalRepositoryImpl(get<_i9.LocalDatasource>()));
  gh.factory<_i12.SignInBloc>(() => _i12.SignInBloc());
  gh.factory<_i13.SignUpBloc>(() => _i13.SignUpBloc());
  gh.lazySingleton<_i14.AuthRepository>(
      () => _i15.AuthRepositoryImpl(get<_i5.AuthService>()));
  gh.lazySingleton<_i16.FirebaseRepository>(
      () => _i17.FirebaseRepositoryImpl(get<_i8.FirestoreDatabaseService>()));
  gh.factory<_i18.GetAllStagesUseCase>(
      () => _i18.GetAllStagesUseCase(get<_i10.LocalRepository>()));
  gh.factory<_i19.GetCurrentUserUseCase>(
      () => _i19.GetCurrentUserUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i20.GetUserUseCase>(
      () => _i20.GetUserUseCase(get<_i16.FirebaseRepository>()));
  gh.factory<_i21.HomeBloc>(
      () => _i21.HomeBloc(get<_i18.GetAllStagesUseCase>()));
  gh.factory<_i22.OnAuthStateChangesUseCase>(
      () => _i22.OnAuthStateChangesUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i20.SaveUserUseCase>(
      () => _i20.SaveUserUseCase(get<_i16.FirebaseRepository>()));
  gh.factory<_i23.SignInWithEmailAndPasswordUseCase>(
      () => _i23.SignInWithEmailAndPasswordUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i24.SignInWithFacebookUseCase>(
      () => _i24.SignInWithFacebookUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i25.SignInWithGoogleUseCase>(
      () => _i25.SignInWithGoogleUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i26.SignOutUseCase>(
      () => _i26.SignOutUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i27.SignUpWithEmailAndPasswordUseCase>(
      () => _i27.SignUpWithEmailAndPasswordUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i20.CheckUserExistsUseCase>(
      () => _i20.CheckUserExistsUseCase(get<_i16.FirebaseRepository>()));
  gh.factory<_i28.AuthBloc>(() => _i28.AuthBloc(
      get<_i22.OnAuthStateChangesUseCase>(),
      get<_i19.GetCurrentUserUseCase>(),
      get<_i25.SignInWithGoogleUseCase>(),
      get<_i24.SignInWithFacebookUseCase>(),
      get<_i23.SignInWithEmailAndPasswordUseCase>(),
      get<_i27.SignUpWithEmailAndPasswordUseCase>(),
      get<_i26.SignOutUseCase>(),
      get<_i20.SaveUserUseCase>(),
      get<_i20.CheckUserExistsUseCase>()));
  return get;
}

class _$AppModule extends _i29.AppModule {}
