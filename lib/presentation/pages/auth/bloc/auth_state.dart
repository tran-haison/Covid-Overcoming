import 'package:covid_overcoming/core/error/error.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitialState extends AuthState {}

/// Get user info
class AuthGetCurrentUserLoadingState extends AuthState {}

class AuthGetCurrentUserSuccessState extends AuthState {
  final User user;

  const AuthGetCurrentUserSuccessState(this.user);
}

class AuthGetCurrentUserFailedState extends AuthState {
  final Error error;

  const AuthGetCurrentUserFailedState(this.error);
}

/// Sign in
class AuthSignInLoadingState extends AuthState {}

class AuthSignInSuccessState extends AuthState {
  final User user;

  const AuthSignInSuccessState(this.user);
}

class AuthSignInFailedState extends AuthState {
  final Error error;

  const AuthSignInFailedState(this.error);
}

/// Sign up
class AuthSignUpLoadingState extends AuthState {}

class AuthSignUpSuccessState extends AuthState {
  final User user;

  const AuthSignUpSuccessState(this.user);
}

class AuthSignUpFailedState extends AuthState {
  final Error error;

  const AuthSignUpFailedState(this.error);
}

/// Sign out
class AuthSignOutLoadingState extends AuthState {}

class AuthSignOutSuccessState extends AuthState {}

class AuthSignOutFailedState extends AuthState {
  final Error error;

  const AuthSignOutFailedState(this.error);
}
