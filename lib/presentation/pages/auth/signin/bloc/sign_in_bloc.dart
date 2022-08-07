import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_state.dart';
import 'package:covid_overcoming/utils/extension/string_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEmailChangedEvent>(_onEmailChangedEvent);
    on<SignInPasswordChangedEvent>(_onPasswordChangedEvent);
  }

  void _onEmailChangedEvent(
    SignInEmailChangedEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(email: event.email));
    _checkValidFields(emit);
  }

  void _onPasswordChangedEvent(
    SignInPasswordChangedEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(password: event.password));
    _checkValidFields(emit);
  }

  void _checkValidFields(Emitter emit) {
    final email = state.email;
    final password = state.password;
    if (email.isValidEmail && password.isNotEmpty) {
      emit(state.copyWith(isFieldsValid: true));
    } else {
      emit(state.copyWith(isFieldsValid: false));
    }
  }
}
