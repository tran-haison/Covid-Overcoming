import 'package:covid_overcoming/domain/usecase/auth/auth_action_usecase.dart';
import 'package:covid_overcoming/domain/usecase/local/cache/cache_account_usecase.dart';
import 'package:covid_overcoming/domain/usecase/local/cache/cache_data_usecase.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_event.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._getLocalAccountUseCase,
    this._signOutUseCase,
    this._clearCacheDataUseCase,
  ) : super(ProfileInitialState()) {
    on<ProfileGetLocalAccountEvent>(_onProfileGetLocalAccountEvent);
    on<ProfileSignOutEvent>(_onProfileSignOutEvent);
  }

  final GetLocalAccountUseCase _getLocalAccountUseCase;
  final SignOutUseCase _signOutUseCase;
  final ClearCacheDataUseCase _clearCacheDataUseCase;

  Future<void> _onProfileGetLocalAccountEvent(
    ProfileGetLocalAccountEvent event,
    Emitter emit,
  ) async {
    emit(ProfileGetLocalAccountLoadingState(oldState: state));

    final res = await _getLocalAccountUseCase();
    if (res.isRight) {
      emit(ProfileGetLocalAccountSuccessState(
        oldState: state,
        accountModel: res.right,
      ));
    } else {
      emit(ProfileGetLocalAccountFailedState(
        oldState: state,
        error: res.left,
      ));
    }
  }

  Future<void> _onProfileSignOutEvent(
    ProfileSignOutEvent event,
    Emitter emit,
  ) async {
    emit(ProfileSignOutLoadingState());

    final res = await _signOutUseCase();
    if (res.isRight) {
      await _clearCacheDataUseCase();
      emit(ProfileSignOutSuccessState());
    } else {
      emit(ProfileSignOutFailedState(res.left));
    }
  }
}
