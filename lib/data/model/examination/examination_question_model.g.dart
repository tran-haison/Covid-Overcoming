// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_question_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExaminationQuestionModel _$ExaminationQuestionModelFromJson(
        Map<String, dynamic> json) =>
    ExaminationQuestionModel(
      id: json['id'] as String,
      question: json['question'] as String,
      rightAnswerIds: (json['right_answer_ids'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      answers: (json['answers'] as List<dynamic>?)
          ?.map(
              (e) => ExaminationAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ExaminationQuestionModelToJson(
        ExaminationQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'right_answer_ids': instance.rightAnswerIds,
      'answers': instance.answers,
    };
