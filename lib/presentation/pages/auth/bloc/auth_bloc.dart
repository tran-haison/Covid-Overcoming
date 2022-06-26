import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/domain/usecase/auth/auth_action_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/manage_user_usecase.dart';
import 'package:covid_overcoming/domain/usecase/local/cache/cache_data_usecase.dart';
import 'package:covid_overcoming/domain/usecase/local/cache/cache_account_usecase.dart';
import 'package:covid_overcoming/domain/usecase/remote/firebase/firebase_account_usecase.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._getCurrentUserUseCase,
    this._signInWithGoogleUseCase,
    this._signInWithFacebookUseCase,
    this._signInWithEmailAndPasswordUseCase,
    this._signUpWithEmailAndPasswordUseCase,
    this._signOutUseCase,
    this._saveAccountUseCase,
    this._saveLocalAccountUseCase,
    this._clearCacheDataUseCase,
  ) : super(AuthInitialState()) {
    on<AuthGetCurrentUserEvent>(_onGetCurrentUserEvent);
    on<AuthSignInWithGoogleEvent>(_onSignInWithGoogleEvent);
    on<AuthSignInWithFacebookEvent>(_onSignInWithFacebookEvent);
    on<AuthSignInWithEmailAndPasswordEvent>(_onSignInWithEmailAndPasswordEvent);
    on<AuthSignUpWithEmailAndPasswordEvent>(_onSignUpWithEmailAndPasswordEvent);
    on<AuthSignOutEvent>(_onSignOutEvent);
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignInWithFacebookUseCase _signInWithFacebookUseCase;
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;
  final SaveAccountUseCase _saveAccountUseCase;
  final SaveLocalAccountUseCase _saveLocalAccountUseCase;
  final ClearCacheDataUseCase _clearCacheDataUseCase;

  Future<void> _onGetCurrentUserEvent(
    AuthGetCurrentUserEvent event,
    Emitter emit,
  ) async {
    emit(AuthGetCurrentUserLoadingState());

    // Get current user auth
    final res = await _getCurrentUserUseCase();
    if (res.isRight) {
      emit(AuthGetCurrentUserSuccessState(res.right));
    } else {
      emit(AuthGetCurrentUserFailedState(res.left));
    }
  }

  Future<void> _onSignInWithGoogleEvent(
    AuthSignInWithGoogleEvent event,
    Emitter emit,
  ) async {
    await _signInWithSocial(
      emit: emit,
      signInFunction: _signInWithGoogleUseCase,
    );
  }

  Future<void> _onSignInWithFacebookEvent(
    AuthSignInWithFacebookEvent event,
    Emitter emit,
  ) async {
    await _signInWithSocial(
      emit: emit,
      signInFunction: _signInWithFacebookUseCase,
    );
  }

  Future<void> _onSignInWithEmailAndPasswordEvent(
    AuthSignInWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignInLoadingState());

    // Sign in
    final res = await _signInWithEmailAndPasswordUseCase(
      SignInWithEmailAndPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    if (res.isRight) {
      final user = res.right;
      final accountModel = AccountModel.fromUser(user);
      await _saveLocalAccount(accountModel);
      emit(AuthSignInSuccessState(user));
    } else {
      emit(AuthSignInFailedState(res.left));
    }
  }

  Future<void> _onSignUpWithEmailAndPasswordEvent(
    AuthSignUpWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignUpLoadingState());

    // Sign up new user
    final res = await _signUpWithEmailAndPasswordUseCase(
      SignUpWithEmailAndPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    if (res.isRight) {
      final user = res.right;
      final accountModel = AccountModel.fromUser(user);

      // No need to handle the result, just call api
      await _saveFirebaseAccount(
        accountModel: accountModel,
        shouldReplace: true,
      );

      emit(AuthSignUpSuccessState(user));
    } else {
      emit(AuthSignUpFailedState(res.left));
    }
  }

  Future<void> _signInWithSocial({
    required Emitter emit,
    required Future<Either<Error, User>> Function() signInFunction,
  }) async {
    emit(AuthSignInLoadingState());

    final res = await signInFunction();
    if (res.isRight) {
      final user = res.right;
      final accountModel = AccountModel.fromUser(user);

      // Should not overwrite user info
      // Just save user info first time login
      // Eg: Google, Facebook, ...

      // No need to handle the result, just call api here
      await _saveFirebaseAccount(
        accountModel: accountModel,
        shouldReplace: false,
      );
      await _saveLocalAccount(accountModel);

      emit(AuthSignInSuccessState(user));
    } else {
      emit(AuthSignInFailedState(res.left));
    }
  }

  Future<void> _onSignOutEvent(
    AuthSignOutEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignOutLoadingState());

    // Sign out
    final res = await _signOutUseCase();
    if (res.isRight) {
      await _clearCacheDataUseCase();
      emit(AuthSignOutSuccessState());
    } else {
      emit(AuthSignOutFailedState(res.left));
    }
  }

  Future<Either<Error, bool>> _saveFirebaseAccount({
    required AccountModel accountModel,
    required bool shouldReplace,
  }) async {
    final params = FirebaseSaveAccountParams(
      accountModel: accountModel,
      shouldReplace: shouldReplace,
    );
    return await _saveAccountUseCase(params);
  }

  Future<Either<Error, bool>> _saveLocalAccount(AccountModel accountModel) async {
    return await _saveLocalAccountUseCase(accountModel);
  }
}
