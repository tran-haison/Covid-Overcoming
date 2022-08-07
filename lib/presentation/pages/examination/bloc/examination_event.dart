part of 'examination_bloc.dart';

abstract class ExaminationEvent extends Equatable {
  const ExaminationEvent();

  @override
  List<Object?> get props => [];
}

class ExaminationGetFirstQuestionEvent extends ExaminationEvent {}

class ExaminationGetNextQuestionEvent extends ExaminationEvent {
  const ExaminationGetNextQuestionEvent(this.currentAnswerId);

  final String currentAnswerId;
}

class ExaminationSubmitAnswerEvent extends ExaminationEvent {}
