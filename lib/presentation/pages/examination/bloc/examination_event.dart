part of 'examination_bloc.dart';

abstract class ExaminationEvent extends Equatable {
  const ExaminationEvent();

  @override
  List<Object?> get props => [];
}

class ExaminationNextQuestionEvent extends ExaminationEvent {
  const ExaminationNextQuestionEvent(this.currentAnswerId);

  final String currentAnswerId;
}

class ExaminationSubmitAnswerEvent extends ExaminationEvent {}
