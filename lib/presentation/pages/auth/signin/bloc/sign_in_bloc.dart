import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/bloc/sign_in_state.dart';
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
  }

  void _onPasswordChangedEvent(
    SignInPasswordChangedEvent event,
    Emitter emit,
  ) {
    emit(state.copyWith(password: event.password));
  }
}
