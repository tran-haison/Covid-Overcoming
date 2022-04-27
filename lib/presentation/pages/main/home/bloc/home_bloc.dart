import 'package:covid_overcoming/domain/usecase/local/get_all_stages_usecase.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_event.dart';
import 'package:covid_overcoming/presentation/pages/main/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(
    this._getAllStagesUseCase,
  ) : super(HomeState());

  final GetAllStagesUseCase _getAllStagesUseCase;
}
