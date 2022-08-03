import 'package:bloc/bloc.dart';
import 'package:covid_overcoming/data/datasource/mock/mock_data.dart';
import 'package:covid_overcoming/data/model/examination/examination_question_model.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'examination_event.dart';

part 'examination_state.dart';

@injectable
class ExaminationBloc extends Bloc<ExaminationEvent, ExaminationState> {
  ExaminationBloc() : super(ExaminationInitial()) {
    on<ExaminationNextQuestionEvent>(_onExaminationNextQuestionEvent);
  }

  bool isAssessmentPassed = true;
  bool isLowRisk = true;
  bool isPassLowRiskQuestions = false;
  int currentQuestionIndex = 0;

  final lastLowRiskQuestionIndex = MockData.lowRiskQuestions.length - 1;
  final highRiskQuestions = MockData.highRiskQuestions;
  final commonQuestions = MockData.commonQuestions;

  List<ExaminationQuestionModel> questions = MockData.lowRiskQuestions;

  Future<void> _onExaminationNextQuestionEvent(
    ExaminationNextQuestionEvent event,
    Emitter emit,
  ) async {
    emit(ExaminationLoadingState());

    // Submit answer if this is the last question
    if (isPassLowRiskQuestions && currentQuestionIndex >= questions.length) {
      emit(ExaminationShouldSubmitState());
      return;
    }

    // Add new questions based on evaluation of low risk
    if (!isPassLowRiskQuestions &&
        currentQuestionIndex > lastLowRiskQuestionIndex) {
      isPassLowRiskQuestions = true;
      if (!isLowRisk) {
        questions.addAll(highRiskQuestions);
      }
      questions.addAll(commonQuestions);
    }

    // Get current question and answer
    final currentAnswerId = event.currentAnswerId;
    final currentQuestion = questions[currentQuestionIndex];
    final rightAnswerIds = currentQuestion.rightAnswerIds;

    // Set isLowRisk to false if the answer does not match
    if (currentQuestionIndex <= lastLowRiskQuestionIndex &&
        !rightAnswerIds.contains(currentAnswerId)) {
      isLowRisk = false;
    }

    // If 1 question fails -> the result will be failed
    if (!rightAnswerIds.contains(currentAnswerId)) {
      isAssessmentPassed = false;
    }

    currentQuestionIndex++;

    final nextQuestion = questions[currentQuestionIndex];

    emit(ExaminationGetNextQuestionState(nextQuestion));
  }
}
