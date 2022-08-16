import 'package:json_annotation/json_annotation.dart';

part 'examination_answer_model.g.dart';

@JsonSerializable()
class ExaminationAnswerModel {
  const ExaminationAnswerModel({
    required this.id,
    required this.literal,
    required this.answer,
  });

  final String id;

  final String literal;

  final String answer;

  factory ExaminationAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$ExaminationAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExaminationAnswerModelToJson(this);

  @override
  String toString() {
    return 'ID: $id - Literal: $literal - Answer: $answer';
  }
}
