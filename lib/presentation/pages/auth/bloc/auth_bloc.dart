import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/domain/usecase/auth/get_current_user_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/on_auth_state_changes_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_in_with_email_and_password_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_in_with_facebook_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_in_with_google_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_out_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_up_with_email_and_password_usecase.dart';
import 'package:covid_overcoming/domain/usecase/remote/firebase/firebase_user_usecase.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._onAuthStateChangesUseCase,
    this._getCurrentUserUseCase,
    this._signInWithGoogleUseCase,
    this._signInWithFacebookUseCase,
    this._signInWithEmailAndPasswordUseCase,
    this._signUpWithEmailAndPasswordUseCase,
    this._signOutUseCase,
    this._saveUserUseCase,
    this._checkUserExistsUseCase,
  ) : super(AuthInitialState()) {
    on<AuthGetCurrentUserEvent>(_onGetCurrentUserEvent);
    on<AuthSignInWithGoogleEvent>(_onSignInWithGoogleEvent);
    on<AuthSignInWithFacebookEvent>(_onSignInWithFacebookEvent);
    on<AuthSignInWithEmailAndPasswordEvent>(_onSignInWithEmailAndPasswordEvent);
    on<AuthSignUpWithEmailAndPasswordEvent>(_onSignUpWithEmailAndPasswordEvent);
    on<AuthSignOutEvent>(_onSignOutEvent);
  }

  final OnAuthStateChangesUseCase _onAuthStateChangesUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignInWithFacebookUseCase _signInWithFacebookUseCase;
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final CheckUserExistsUseCase _checkUserExistsUseCase;

  Stream<User?> onAuthStateChanges() {
    return _onAuthStateChangesUseCase();
  }

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
      emit(AuthGetCurrentUserFailedState(res.left.message));
    }
  }

  Future<void> _onSignInWithGoogleEvent(
    AuthSignInWithGoogleEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignInLoadingState());

    // Sign in with Google
    final resSignIn = await _signInWithGoogleUseCase();
    await _signInWithSocial(emit, resSignIn);
  }

  Future<void> _onSignInWithFacebookEvent(
    AuthSignInWithFacebookEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignInLoadingState());

    // Sign in with Facebook
    final resSignIn = await _signInWithFacebookUseCase();
    await _signInWithSocial(emit, resSignIn);
  }

  Future<void> _onSignInWithEmailAndPasswordEvent(
    AuthSignInWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignInLoadingState());

    // Sign in
    final result = await _signInWithEmailAndPasswordUseCase(
      SignInWithEmailAndPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    if (result.isRight) {
      emit(AuthSignInSuccessState(result.right));
    } else {
      emit(AuthSignInFailedState(result.left.message));
    }
  }

  Future<void> _onSignUpWithEmailAndPasswordEvent(
    AuthSignUpWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignUpLoadingState());

    // Sign up new user
    final resSignUp = await _signUpWithEmailAndPasswordUseCase(
      SignUpWithEmailAndPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    if (resSignUp.isRight) {
      final user = resSignUp.right;
      final userModel = UserModel.fromUser(user);

      // Save user info if sign up success
      final resSaveUser = await _saveUserUseCase(userModel);
      if (resSaveUser.isRight) {
        emit(AuthSignUpSuccessState(user));
      } else {
        emit(AuthSignUpFailedState(resSaveUser.left.message));
      }
    } else {
      emit(AuthSignUpFailedState(resSignUp.left.message));
    }
  }

  Future<void> _onSignOutEvent(
    AuthSignOutEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignOutLoadingState());

    // Sign out
    final result = await _signOutUseCase();
    if (result.isRight) {
      emit(AuthSignOutSuccessState());
    } else {
      emit(AuthSignOutFailedState(result.left.message));
    }
  }

  Future<void> _signInWithSocial(
    Emitter emit,
    Either<Error, User> resSignIn,
  ) async {
    if (resSignIn.isRight) {
      final user = resSignIn.right;
      // Check if user already exists or not
      final resCheckUser = await _checkUserExistsUseCase(user.uid);
      if (resCheckUser.isRight) {
        final isUserExisted = resCheckUser.right;
        if (!isUserExisted) {
          // Save new user if not exists
          final userModel = UserModel.fromUser(user);
          final resSaveUser = await _saveUserUseCase(userModel);
          if (resSaveUser.isRight) {
            emit(AuthSignInSuccessState(user));
            return;
          }
          emit(AuthSignInFailedState(resSaveUser.left.message));
          return;
        }
        emit(AuthSignInSuccessState(user));
        return;
      }
      emit(AuthSignInFailedState(resCheckUser.left.message));
      return;
    }
    emit(AuthSignInFailedState(resSignIn.left.message));
  }
}
