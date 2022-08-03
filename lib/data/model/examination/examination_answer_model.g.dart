// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'examination_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExaminationAnswerModel _$ExaminationAnswerModelFromJson(
        Map<String, dynamic> json) =>
    ExaminationAnswerModel(
      id: json['id'] as String,
      literal: json['literal'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$ExaminationAnswerModelToJson(
        ExaminationAnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'literal': instance.literal,
      'answer': instance.answer,
    };
