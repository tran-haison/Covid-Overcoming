import 'package:covid_overcoming/data/model/knowledge/knowledge_model.dart';
import 'package:covid_overcoming/data/model/rule/sub_rule_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rule_model.g.dart';

@JsonSerializable()
class RuleModel {
  const RuleModel({
    required this.id,
    required this.name,
    required this.query,
    this.knowledges,
    this.subRules,
  });

  final String id;

  final String name;

  final String query;

  final List<KnowledgeModel>? knowledges;

  final List<SubRuleModel>? subRules;

  factory RuleModel.fromJson(Map<String, dynamic> json) =>
      _$RuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$RuleModelToJson(this);

  RuleModel copyWith({
    String? id,
    String? name,
    String? query,
    List<KnowledgeModel>? knowledges,
    List<SubRuleModel>? subRules,
  }) {
    return RuleModel(
      id: id ?? this.id,
      name: name ?? this.name,
      query: query ?? this.query,
      knowledges: knowledges ?? this.knowledges,
      subRules: subRules ?? this.subRules,
    );
  }

  @override
  String toString() {
    return 'ID: $id - '
        'Name: $name - '
        'Query: ${query.toString()} - '
        'Knowledges: ${knowledges.toString()} - '
        'Sub-rules: ${subRules.toString()}';
  }
}
