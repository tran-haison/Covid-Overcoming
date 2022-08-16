import 'package:covid_overcoming/data/model/examination/examination_answer_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'examination_question_model.g.dart';

@JsonSerializable()
class ExaminationQuestionModel {
  const ExaminationQuestionModel({
    required this.id,
    required this.question,
    required this.rightAnswerIds,
    required this.answers,
  });

  final String id;

  final String question;

  @JsonKey(name: 'right_answer_ids')
  final List<String> rightAnswerIds;

  final List<ExaminationAnswerModel>? answers;

  factory ExaminationQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$ExaminationQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExaminationQuestionModelToJson(this);

  ExaminationQuestionModel copyWith({
    String? id,
    String? question,
    List<String>? rightAnswerIds,
    List<ExaminationAnswerModel>? answers,
  }) {
    return ExaminationQuestionModel(
      id: id ?? this.id,
      question: question ?? this.question,
      rightAnswerIds: rightAnswerIds ?? this.rightAnswerIds,
      answers: answers ?? this.answers,
    );
  }

  @override
  String toString() {
    return 'ID: $id - Question: $question - Right answer ids: ${rightAnswerIds.toString()} - Answers: ${answers.toString()}';
  }
}
