import 'package:json_annotation/json_annotation.dart';

part 'knowledge_model.g.dart';

@JsonSerializable()
class KnowledgeModel {
  const KnowledgeModel({
    required this.id,
    required this.literal,
    required this.sentence,
  });

  final String id;

  final String literal;

  final String sentence;

  factory KnowledgeModel.fromJson(Map<String, dynamic> json) =>
      _$KnowledgeModelFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeModelToJson(this);

  @override
  String toString() {
    return 'ID: $id - Literal: $literal - Sentence: $sentence';
  }
}
