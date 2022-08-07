import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileRequestToBecomeExpertEvent extends ProfileEvent {}

class ProfileGetLocalAccountEvent extends ProfileEvent {}

class ProfileSignOutEvent extends ProfileEvent {}
