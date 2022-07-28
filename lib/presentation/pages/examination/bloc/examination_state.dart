part of 'examination_bloc.dart';

abstract class ExaminationState extends Equatable {
  const ExaminationState();
}

class ExaminationInitial extends ExaminationState {
  @override
  List<Object> get props => [];
}
