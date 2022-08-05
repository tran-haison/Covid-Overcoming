part of 'examination_bloc.dart';

abstract class ExaminationState extends Equatable {
  const ExaminationState();

  @override
  List<Object> get props => [];
}

class ExaminationInitial extends ExaminationState {}

class ExaminationLoadingState extends ExaminationState {}

class ExaminationGetQuestionSuccessState extends ExaminationState {
  const ExaminationGetQuestionSuccessState(this.question);

  final ExaminationQuestionModel question;

  @override
  List<Object> get props => [question];
}

class ExaminationShouldSubmitState extends ExaminationState {}
