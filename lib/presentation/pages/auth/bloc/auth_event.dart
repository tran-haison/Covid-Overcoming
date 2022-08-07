import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthGetCurrentUserEvent extends AuthEvent {}

class AuthSignInWithGoogleEvent extends AuthEvent {}

class AuthSignInWithFacebookEvent extends AuthEvent {}

class AuthSignInWithEmailAndPasswordEvent extends AuthEvent {
  const AuthSignInWithEmailAndPasswordEvent(this.email, this.password);

  final String email;
  final String password;
}

class AuthSignUpWithEmailAndPasswordEvent extends AuthEvent {
  const AuthSignUpWithEmailAndPasswordEvent(this.email, this.password);

  final String email;
  final String password;
}

class AuthSignOutEvent extends AuthEvent {}
