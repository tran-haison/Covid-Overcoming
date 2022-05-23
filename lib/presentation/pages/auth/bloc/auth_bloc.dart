import 'package:covid_overcoming/domain/usecase/auth/get_current_user_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/on_auth_state_changes_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_in_with_email_and_password_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_out_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_up_with_email_and_password_usecase.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._onAuthStateChangesUseCase,
    this._getCurrentUserUseCase,
    this._signInWithEmailAndPasswordUseCase,
    this._signUpWithEmailAndPasswordUseCase,
    this._signOutUseCase,
  ) : super(AuthInitialState()) {
    on<GetCurrentUserEvent>(_onGetCurrentUserEvent);
    on<SignInWithEmailAndPasswordEvent>(_onSignInWithEmailAndPasswordEvent);
    on<SignUpWithEmailAndPasswordEvent>(_onSignUpWithEmailAndPasswordEvent);
    on<SignOutEvent>(_onSignOutEvent);
  }

  final OnAuthStateChangesUseCase _onAuthStateChangesUseCase;
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;
  final SignOutUseCase _signOutUseCase;

  Stream<User?> onAuthStateChanges() {
    return _onAuthStateChangesUseCase();
  }

  Future<void> _onGetCurrentUserEvent(
    GetCurrentUserEvent event,
    Emitter emit,
  ) async {
    emit(AuthGetCurrentUserLoadingState());

    final result = await _getCurrentUserUseCase();

    if (result.isRight) {
      final user = result.right;
      emit(AuthGetCurrentUserSuccessState(user));
    } else {
      final error = result.left;
      emit(AuthGetCurrentUserFailedState(error.message));
    }
  }

  Future<void> _onSignInWithEmailAndPasswordEvent(
    SignInWithEmailAndPasswordEvent event,
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
      final user = result.right;
      emit(AuthSignInSuccessState(user));
    } else {
      final error = result.left;
      emit(AuthSignInFailedState(error.message));
    }
  }

  Future<void> _onSignUpWithEmailAndPasswordEvent(
    SignUpWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignUpLoadingState());

    // Sign up
    final result = await _signUpWithEmailAndPasswordUseCase(
      SignUpWithEmailAndPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    if (result.isRight) {
      final user = result.right;
      emit(AuthSignUpSuccessState(user));
    } else {
      final error = result.left;
      emit(AuthSignUpFailedState(error.message));
    }
  }

  Future<void> _onSignOutEvent(
    SignOutEvent event,
    Emitter emit,
  ) async {
    emit(AuthSignOutLoadingState());

    // Sign out
    final result = await _signOutUseCase();

    if (result.isRight) {
      emit(AuthSignOutSuccessState());
    } else {
      final error = result.left;
      emit(AuthSignOutFailedState(error.message));
    }
  }
}
