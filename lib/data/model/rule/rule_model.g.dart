// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RuleModel _$RuleModelFromJson(Map<String, dynamic> json) => RuleModel(
      id: json['id'] as String,
      name: json['name'] as String,
      query: json['query'] as String,
      knowledges: (json['knowledges'] as List<dynamic>?)
          ?.map((e) => KnowledgeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      subRules: (json['subRules'] as List<dynamic>?)
          ?.map((e) => SubRuleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RuleModelToJson(RuleModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'query': instance.query,
      'knowledges': instance.knowledges,
      'subRules': instance.subRules,
    };
