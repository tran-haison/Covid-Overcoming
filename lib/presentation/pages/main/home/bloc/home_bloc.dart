import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/data/model/examination/examination_question_model.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:covid_overcoming/domain/usecase/local/database/get_all_stages_usecase.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_event.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllStagesUseCase,
    this._localCacheRepository,
    this._firebaseRepository,
  ) : super(HomeInitialState()) {
    on<HomeGetAllStagesEvent>(_onHomeGetAllStagesEvent);
    on<HomeGetLocalAccountEvent>(_onHomeGetLocalAccountEvent);
  }

  final GetAllStagesUseCase _getAllStagesUseCase;
  final LocalCacheRepository _localCacheRepository;
  final FirebaseRepository _firebaseRepository;

  Future<void> _onHomeGetAllStagesEvent(
    HomeGetAllStagesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeGetAllStagesLoadingState());

    // Get all stages
    final res = await _getAllStagesUseCase();
    if (res.isRight) {
      emit(HomeGetAllStagesSuccessState(res.right));
    } else {
      emit(HomeGetAllStagesFailedState(res.left));
    }
  }

  Future<void> _onHomeGetLocalAccountEvent(
    HomeGetLocalAccountEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeGetLocalAccountLoadingState(oldState: state));

    final account = await _localCacheRepository.getAccount();
    emit(HomeGetLocalAccountSuccessState(
      oldState: state,
      accountModel: account,
    ));

    final result = await getExaminationQuestions();
    Log.d(result[0].toString());
  }

  Future<List<ExaminationQuestionModel>> getExaminationQuestions() {
    return _firebaseRepository.getExaminationQuestions(
      id: 'CmcGsiT2Q1DjCc2VkShZ',
      questionType: 'common-questions',
    );
  }
}
