import 'package:covid_overcoming/domain/usecase/local/cache/cache_account_usecase.dart';
import 'package:covid_overcoming/domain/usecase/local/database/get_all_stages_usecase.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_event.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllStagesUseCase,
    this._getLocalAccountUseCase,
  ) : super(HomeInitialState()) {
    on<HomeGetAllStagesEvent>(_onHomeGetAllStagesEvent);
    on<HomeGetLocalAccountEvent>(_onHomeGetLocalAccountEvent);
  }

  final GetAllStagesUseCase _getAllStagesUseCase;
  final GetLocalAccountUseCase _getLocalAccountUseCase;

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

    final res = await _getLocalAccountUseCase();
    if (res.isRight) {
      emit(HomeGetLocalAccountSuccessState(
        oldState: state,
        accountModel: res.right,
      ));
    } else {
      emit(HomeGetLocalAccountFailedState(oldState: state, error: res.left));
    }
  }
}
