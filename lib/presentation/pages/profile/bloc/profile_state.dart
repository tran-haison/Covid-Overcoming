import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState({
    this.accountModel,
  });

  final AccountModel? accountModel;

  @override
  List<Object?> get props => [];
}

class ProfileInitialState extends ProfileState {}

/// Request to become expert
abstract class ProfileRequestToBecomeExpertState extends ProfileState {
  ProfileRequestToBecomeExpertState({
    required ProfileState oldState,
    AccountModel? accountModel,
  }) : super(accountModel: accountModel ?? oldState.accountModel);
}

class ProfileRequestToBecomeExpertLoadingState
    extends ProfileRequestToBecomeExpertState {
  ProfileRequestToBecomeExpertLoadingState({
    required ProfileState oldState,
  }) : super(oldState: oldState);
}

class ProfileRequestToBecomeExpertSuccessState
    extends ProfileRequestToBecomeExpertState {
  ProfileRequestToBecomeExpertSuccessState({
    required ProfileState oldState,
    required AccountModel accountModel,
  }) : super(oldState: oldState, accountModel: accountModel);
}

class ProfileRequestToBecomeExpertFailedState
    extends ProfileRequestToBecomeExpertState {
  ProfileRequestToBecomeExpertFailedState({
    required ProfileState oldState,
    Error? error,
  }) : super(oldState: oldState);
}

/// Get local account
abstract class ProfileGetLocalAccountState extends ProfileState {
  ProfileGetLocalAccountState({
    required ProfileState oldState,
    AccountModel? accountModel,
  }) : super(accountModel: accountModel ?? oldState.accountModel);
}

class ProfileGetLocalAccountLoadingState extends ProfileGetLocalAccountState {
  ProfileGetLocalAccountLoadingState({
    required ProfileState oldState,
  }) : super(oldState: oldState);
}

class ProfileGetLocalAccountSuccessState extends ProfileGetLocalAccountState {
  ProfileGetLocalAccountSuccessState({
    required ProfileState oldState,
    required AccountModel accountModel,
  }) : super(oldState: oldState, accountModel: accountModel);
}

class ProfileGetLocalAccountFailedState extends ProfileGetLocalAccountState {
  ProfileGetLocalAccountFailedState({
    required ProfileState oldState,
    Error? error,
  }) : super(oldState: oldState);
}

/// Sign out
abstract class ProfileSignOutState extends ProfileState {}

class ProfileSignOutLoadingState extends ProfileSignOutState {}

class ProfileSignOutSuccessState extends ProfileSignOutState {}

class ProfileSignOutFailedState extends ProfileSignOutState {
  final Error error;

  ProfileSignOutFailedState(this.error);
}
