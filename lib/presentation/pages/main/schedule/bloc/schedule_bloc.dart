import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:covid_overcoming/presentation/pages/main/schedule/bloc/schedule_event.dart';
import 'package:covid_overcoming/presentation/pages/main/schedule/bloc/schedule_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ScheduleBloc extends Bloc<ScheduleEvent, ScheduleState> {
  ScheduleBloc(
    this.firebaseRepository,
  ) : super(ScheduleInitialState());

  final FirebaseRepository firebaseRepository;

  Stream<List<AccountModel>> get accountsStream {
    return firebaseRepository.getAccountsStream();
  }
}
