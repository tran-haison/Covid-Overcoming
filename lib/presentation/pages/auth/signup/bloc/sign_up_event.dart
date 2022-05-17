import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object?> get props => [];
}

class SignUpEmailChangedEvent extends SignUpEvent {
  const SignUpEmailChangedEvent(this.email);
  final String email;
}

class SignUpPasswordChangedEvent extends SignUpEvent {
  const SignUpPasswordChangedEvent(this.password);
  final String password;
}

class SignUpConfirmPasswordChangedEvent extends SignUpEvent {
  const SignUpConfirmPasswordChangedEvent(this.confirmPassword);
  final String confirmPassword;
}