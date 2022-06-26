import 'package:covid_overcoming/utils/extension/string_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  const ChatMessageModel({
    required this.idFrom,
    required this.idTo,
    required this.message,
    required this.createdAt,
    required this.type,
  });

  @JsonKey(name: 'id_from')
  final String idFrom;

  @JsonKey(name: 'id_to')
  final String idTo;

  final String message;

  @JsonKey(name: 'created_at')
  final String createdAt;

  final int type;

  DateTime get createdAtDateTime => createdAt.toDateTime();

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}
