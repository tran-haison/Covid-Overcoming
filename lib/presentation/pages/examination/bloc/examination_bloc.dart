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
    on<ExaminationGetFirstQuestionEvent>(_onExaminationGetFirstQuestionEvent);
    on<ExaminationGetNextQuestionEvent>(_onExaminationGetNextQuestionEvent);
  }

  bool isAssessmentPassed = true;
  bool isLowRisk = true;
  bool isPassLowRiskQuestions = false;
  int currentQuestionIndex = 0;

  final lastLowRiskQuestionIndex = MockData.lowRiskQuestions.length - 1;
  final lowRiskQuestions = MockData.lowRiskQuestions;
  final highRiskQuestions = MockData.highRiskQuestions;
  final commonQuestions = MockData.commonQuestions;

  List<ExaminationQuestionModel> questions = [];

  Future<void> _onExaminationGetFirstQuestionEvent(
    ExaminationGetFirstQuestionEvent event,
    Emitter emit,
  ) async {
    emit(ExaminationLoadingState());

    questions.addAll(lowRiskQuestions);
    final firstQuestion = questions[0];

    emit(ExaminationGetQuestionSuccessState(firstQuestion));
  }

  Future<void> _onExaminationGetNextQuestionEvent(
    ExaminationGetNextQuestionEvent event,
    Emitter emit,
  ) async {
    emit(ExaminationLoadingState());

    // Add new questions based on evaluation of low risk
    if (!isPassLowRiskQuestions &&
        currentQuestionIndex >= lastLowRiskQuestionIndex) {
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

    if (!rightAnswerIds.contains(currentAnswerId)) {
      if (currentQuestionIndex <= lastLowRiskQuestionIndex) {
        isLowRisk = false;
      } else {
        isAssessmentPassed = false;
      }
    }

    currentQuestionIndex++;

    // Submit answer if this is the last question
    if (isPassLowRiskQuestions && currentQuestionIndex >= questions.length) {
      emit(ExaminationShouldSubmitState());
      return;
    }

    final nextQuestion = questions[currentQuestionIndex];

    emit(ExaminationGetQuestionSuccessState(nextQuestion));
  }
}
