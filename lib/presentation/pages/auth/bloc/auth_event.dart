import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignInWithEmailAndPasswordEvent extends AuthEvent {
  const SignInWithEmailAndPasswordEvent(this.email, this.password);
  final String email;
  final String password;
}

class SignUpWithEmailAndPasswordEvent extends AuthEvent {
  const SignUpWithEmailAndPasswordEvent(this.email, this.password);
  final String email;
  final String password;
}
