import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:covid_overcoming/domain/usecase/auth/auth_action_usecase.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_event.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(
    this._signOutUseCase,
    this._localCacheRepository,
  ) : super(ProfileInitialState()) {
    on<ProfileGetLocalAccountEvent>(_onProfileGetLocalAccountEvent);
    on<ProfileSignOutEvent>(_onProfileSignOutEvent);
  }

  final SignOutUseCase _signOutUseCase;
  final LocalCacheRepository _localCacheRepository;

  Future<void> _onProfileGetLocalAccountEvent(
    ProfileGetLocalAccountEvent event,
    Emitter emit,
  ) async {
    emit(ProfileGetLocalAccountLoadingState(oldState: state));

    final account = await _localCacheRepository.getAccount();
    emit(ProfileGetLocalAccountSuccessState(
      oldState: state,
      accountModel: account,
    ));
  }

  Future<void> _onProfileSignOutEvent(
    ProfileSignOutEvent event,
    Emitter emit,
  ) async {
    emit(ProfileSignOutLoadingState());

    final res = await _signOutUseCase();
    if (res.isRight) {
      await _localCacheRepository.clear();
      emit(ProfileSignOutSuccessState());
    } else {
      emit(ProfileSignOutFailedState(res.left));
    }
  }
}
