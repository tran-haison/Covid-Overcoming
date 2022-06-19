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
