import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'examination_event.dart';
part 'examination_state.dart';

class ExaminationBloc extends Bloc<ExaminationEvent, ExaminationState> {
  ExaminationBloc() : super(ExaminationInitial()) {
    on<ExaminationEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
