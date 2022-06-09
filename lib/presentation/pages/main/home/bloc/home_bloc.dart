import 'package:covid_overcoming/domain/usecase/local/get_all_stages_usecase.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_event.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllStagesUseCase,
  ) : super(HomeInitialState()) {
    on<HomeGetAllStagesEvent>(_onHomeGetAllStagesEvent);
    on<HomeGetLocalUserEvent>(_onHomeGetLocalUserEvent);
  }

  final GetAllStagesUseCase _getAllStagesUseCase;

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

  Future<void> _onHomeGetLocalUserEvent(
    HomeGetLocalUserEvent event,
    Emitter<HomeState> emit,
  ) async {
    // TODO: implement function
    emit(HomeGetLocalUserLoadingState());

  }
}
