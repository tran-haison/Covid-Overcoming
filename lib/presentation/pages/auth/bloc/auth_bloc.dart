import 'package:covid_overcoming/domain/usecase/auth/sign_in_with_email_and_password_usecase.dart';
import 'package:covid_overcoming/domain/usecase/auth/sign_up_with_email_and_password_usecase.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._signInWithEmailAndPasswordUseCase,
    this._signUpWithEmailAndPasswordUseCase,
  ) : super(const AuthState()) {
    on<SignInWithEmailAndPasswordEvent>(_onSignInWithEmailAndPasswordEvent);
    on<SignUpWithEmailAndPasswordEvent>(_onSignUpWithEmailAndPasswordEvent);
  }

  final SignInWithEmailAndPasswordUseCase _signInWithEmailAndPasswordUseCase;
  final SignUpWithEmailAndPasswordUseCase _signUpWithEmailAndPasswordUseCase;

  Future<void> _onSignInWithEmailAndPasswordEvent(
    SignInWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Sign in
    final result = await _signInWithEmailAndPasswordUseCase(
      SignInWithEmailAndPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    emit(state.copyWith(isLoading: false));

    // Emit state
    if (result.isRight) {
      final user = result.right;
      emit(state.copyWith(
        isSignInSuccess: true,
        user: user,
        signInError: null,
      ));
    } else {
      final error = result.left;
      emit(state.copyWith(
        isSignInSuccess: false,
        user: null,
        signInError: error,
      ));
    }
  }

  Future<void> _onSignUpWithEmailAndPasswordEvent(
    SignUpWithEmailAndPasswordEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Sign up
    final result = await _signUpWithEmailAndPasswordUseCase(
      SignUpWithEmailAndPasswordParams(
        email: event.email,
        password: event.password,
      ),
    );

    emit(state.copyWith(isLoading: false));

    // Emit state
    if (result.isRight) {
      final user = result.right;
      emit(state.copyWith(
        isSignUpSuccess: true,
        user: user,
        signUpError: null,
      ));
    } else {
      final error = result.left;
      emit(state.copyWith(
        isSignUpSuccess: false,
        user: null,
        signUpError: error,
      ));
    }
  }
}
