import 'package:covid_overcoming/presentation/pages/auth/signup/bloc/sign_up_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/signup/bloc/sign_up_state.dart';
import 'package:covid_overcoming/utils/extension/string_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpEmailChangedEvent>(_onEmailChangedEvent);
    on<SignUpPasswordChangedEvent>(_onPasswordChangedEvent);
    on<SignUpConfirmPasswordChangedEvent>(_onConfirmPasswordChangedEvent);
  }

  void _onEmailChangedEvent(
    SignUpEmailChangedEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(email: event.email));
    _checkValidFields(emit);
  }

  void _onPasswordChangedEvent(
    SignUpPasswordChangedEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(password: event.password));
    _checkValidFields(emit);
  }

  void _onConfirmPasswordChangedEvent(
    SignUpConfirmPasswordChangedEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
    _checkValidFields(emit);
  }

  void _checkValidFields(Emitter emit) {
    final email = state.email;
    final password = state.password;
    final confirmPassword = state.confirmPassword;
    if (email.isValidEmail &&
        password.isNotEmpty &&
        confirmPassword == password) {
      emit(state.copyWith(isFieldsValid: true));
    } else {
      emit(state.copyWith(isFieldsValid: false));
    }
  }
}
