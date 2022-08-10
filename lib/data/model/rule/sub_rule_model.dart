import 'package:json_annotation/json_annotation.dart';

part 'sub_rule_model.g.dart';

@JsonSerializable()
class SubRuleModel {
  const SubRuleModel({
    required this.id,
    required this.type,
    required this.conditions,
    required this.conclusion,
  });

  final String id;

  final String type;

  final List<String> conditions;

  final String conclusion;

  RuleRelationType get relationType =>
      RuleRelationTypeExtension.toRelationType(type);

  factory SubRuleModel.fromJson(Map<String, dynamic> json) =>
      _$SubRuleModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubRuleModelToJson(this);

  @override
  String toString() {
    return 'ID: $id - '
        'Type: $type - '
        'Conditions: ${conditions.toString()} - '
        'Conclusion: $conclusion';
  }
}

enum RuleRelationType { and, or }

extension RuleRelationTypeExtension on RuleRelationType {
  String toRelationString() {
    switch (this) {
      case RuleRelationType.and:
        return 'and';
      case RuleRelationType.or:
        return 'or';
    }
  }

  static RuleRelationType toRelationType(String value) {
    return RuleRelationType.values.firstWhere(
      (relationType) => relationType.toRelationString() == value,
    );
  }
}
