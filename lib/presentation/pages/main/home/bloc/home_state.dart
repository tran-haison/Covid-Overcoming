import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

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

/// Get local user
abstract class HomeGetLocalUserState extends HomeState {}

class HomeGetLocalUserLoadingState extends HomeGetLocalUserState {}

class HomeGetLocalUserSuccessState extends HomeGetLocalUserState {
  HomeGetLocalUserSuccessState(this.userModel);

  final UserModel userModel;
}

class HomeGetLocalUserFailedState extends HomeGetLocalUserState {
  HomeGetLocalUserFailedState(this.error);

  final Error error;
}
