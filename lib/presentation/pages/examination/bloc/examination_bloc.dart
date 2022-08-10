import 'package:bloc/bloc.dart';
import 'package:covid_overcoming/data/model/examination/examination_question_model.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'examination_event.dart';

part 'examination_state.dart';

@injectable
class ExaminationBloc extends Bloc<ExaminationEvent, ExaminationState> {
  ExaminationBloc(
    this._firebaseRepository,
  ) : super(ExaminationInitial()) {
    on<ExaminationGetFirstQuestionEvent>(_onExaminationGetFirstQuestionEvent);
    on<ExaminationGetNextQuestionEvent>(_onExaminationGetNextQuestionEvent);
  }

  final FirebaseRepository _firebaseRepository;

  // Constants
  final examinationId = 'CmcGsiT2Q1DjCc2VkShZ';
  final commonQuestionsParam = 'common-questions';
  final lowRiskQuestionsParam = 'low-risk-questions';
  final highRiskQuestionsParam = 'high-risk-questions';

  bool isAssessmentPassed = true;
  bool isLowRisk = true;
  bool isPassLowRiskQuestions = false;
  int currentQuestionIndex = 0;

  late int lastLowRiskQuestionIndex;
  late List<ExaminationQuestionModel> commonQuestions;
  late List<ExaminationQuestionModel> lowRiskQuestions;
  late List<ExaminationQuestionModel> highRiskQuestions;

  List<ExaminationQuestionModel> questions = [];

  Future<void> _onExaminationGetFirstQuestionEvent(
    ExaminationGetFirstQuestionEvent event,
    Emitter emit,
  ) async {
    emit(ExaminationLoadingState());

    // Init
    await init();
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

  Future<void> init() async {
    commonQuestions = await getCommonQuestions();
    lowRiskQuestions = await getLowRiskQuestions();
    highRiskQuestions = await getHighRiskQuestions();
    lastLowRiskQuestionIndex = lowRiskQuestions.length - 1;
    questions.addAll(lowRiskQuestions);
  }

  Future<List<ExaminationQuestionModel>> getCommonQuestions() {
    return _firebaseRepository.getExaminationQuestions(
      id: examinationId,
      questionType: commonQuestionsParam,
    );
  }

  Future<List<ExaminationQuestionModel>> getLowRiskQuestions() {
    return _firebaseRepository.getExaminationQuestions(
      id: examinationId,
      questionType: lowRiskQuestionsParam,
    );
  }

  Future<List<ExaminationQuestionModel>> getHighRiskQuestions() {
    return _firebaseRepository.getExaminationQuestions(
      id: examinationId,
      questionType: highRiskQuestionsParam,
    );
  }
}
