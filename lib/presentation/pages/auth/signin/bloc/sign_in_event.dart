import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class SignInEmailChangedEvent extends SignInEvent {
  const SignInEmailChangedEvent(this.email);
  final String email;
}

class SignInPasswordChangedEvent extends SignInEvent {
  const SignInPasswordChangedEvent(this.password);
  final String password;
}