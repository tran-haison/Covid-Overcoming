// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubRuleModel _$SubRuleModelFromJson(Map<String, dynamic> json) => SubRuleModel(
      id: json['id'] as String,
      type: json['type'] as String,
      conditions: (json['conditions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      conclusion: json['conclusion'] as String,
    );

Map<String, dynamic> _$SubRuleModelToJson(SubRuleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'conditions': instance.conditions,
      'conclusion': instance.conclusion,
    };
