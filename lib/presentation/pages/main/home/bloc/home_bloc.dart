import 'package:covid_overcoming/domain/usecase/local/get_all_stages_usecase.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_event.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllStagesUseCase,
  ) : super(const HomeState()) {
    on<HomeInitEvent>(_onHomeInitEvent);
  }

  final GetAllStagesUseCase _getAllStagesUseCase;

  Future<void> _onHomeInitEvent(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    // Get all stages
    _getAllStages(emit);

    emit(state.copyWith(isLoading: false));
  }

  void _getAllStages(Emitter<HomeState> emit) {
    _getAllStagesUseCase().then((value) {
      if (value.isRight) {
        emit(state.copyWith(
          stages: value.right,
          stagesError: null,
        ));
      } else {
        emit(state.copyWith(
          stages: null,
          stagesError: value.left,
        ));
      }
    });
  }
}
