import 'package:covid_overcoming/data/model/examination/examination_answer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'examination_question_model.g.dart';

@JsonSerializable()
class ExaminationQuestionModel {
  const ExaminationQuestionModel({
    required this.id,
    required this.question,
    required this.rightAnswer,
    required this.answers,
  });

  final String id;

  final String question;

  @JsonKey(name: 'right_answer')
  final ExaminationAnswerModel rightAnswer;

  final List<ExaminationAnswerModel> answers;

  factory ExaminationQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ExaminationQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExaminationQuestionModelToJson(this);
}
