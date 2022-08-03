// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'knowledge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KnowledgeModel _$KnowledgeModelFromJson(Map<String, dynamic> json) =>
    KnowledgeModel(
      id: json['id'] as String,
      literal: json['literal'] as String,
      sentence: json['sentence'] as String,
    );

Map<String, dynamic> _$KnowledgeModelToJson(KnowledgeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'literal': instance.literal,
      'sentence': instance.sentence,
    };
