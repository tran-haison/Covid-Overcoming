import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState({
    this.accountModel,
  });

  final AccountModel? accountModel;

  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {}

/// Get all stages
abstract class HomeGetAllStagesState extends HomeState {}

class HomeGetAllStagesLoadingState extends HomeGetAllStagesState {}

class HomeGetAllStagesSuccessState extends HomeGetAllStagesState {
  HomeGetAllStagesSuccessState(this.stages);

  final List<Stage> stages;
}

class HomeGetAllStagesFailedState extends HomeGetAllStagesState {
  HomeGetAllStagesFailedState(this.error);

  final Error error;
}

/// Get local account
abstract class HomeGetLocalAccountState extends HomeState {
  HomeGetLocalAccountState({
    required HomeState oldState,
    AccountModel? accountModel,
  }) : super(accountModel: accountModel ?? oldState.accountModel);
}

class HomeGetLocalAccountLoadingState extends HomeGetLocalAccountState {
  HomeGetLocalAccountLoadingState({
    required HomeState oldState,
  }) : super(oldState: oldState);
}

class HomeGetLocalAccountSuccessState extends HomeGetLocalAccountState {
  HomeGetLocalAccountSuccessState({
    required HomeState oldState,
    required AccountModel accountModel,
  }) : super(oldState: oldState, accountModel: accountModel);
}

class HomeGetLocalAccountFailedState extends HomeGetLocalAccountState {
  HomeGetLocalAccountFailedState({
    required HomeState oldState,
    Error? error,
  }) : super(oldState: oldState);
}
