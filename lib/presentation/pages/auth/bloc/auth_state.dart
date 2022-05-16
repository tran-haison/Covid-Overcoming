import 'package:covid_overcoming/core/error/error.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    // Loading
    @Default(false) bool isLoading,

    // User
    @Default(null) User? user,

    // Sign in
    @Default(false) bool isSignInSuccess,
    @Default(null) Error? signInError,

    // Sign up
    @Default(false) bool isSignUpSuccess,
    @Default(null) Error? signUpError,
  }) = _AuthState;
}