import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/domain/entity/local/stage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    // Loading
    @Default(false) bool isLoading,

    // List of stages
    @Default(null) List<Stage>? stages,
    @Default(null) Error? stagesError,
  }) = _HomeState;
}
