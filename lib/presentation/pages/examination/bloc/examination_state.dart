part of 'examination_bloc.dart';

abstract class ExaminationState extends Equatable {
  const ExaminationState();

  @override
  List<Object> get props => [];
}

class ExaminationInitial extends ExaminationState {}

class ExaminationLoadingState extends ExaminationState {}

class ExaminationGetNextQuestionState extends ExaminationState {
  const ExaminationGetNextQuestionState(this.nextQuestion);

  final ExaminationQuestionModel nextQuestion;

  @override
  List<Object> get props => [nextQuestion];
}

class ExaminationShouldSubmitState extends ExaminationState {}
