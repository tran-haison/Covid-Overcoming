import 'package:covid_overcoming/data/model/user/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message_model.g.dart';

@JsonSerializable()
class ChatMessageModel {
  const ChatMessageModel({
    required this.id,
    required this.user,
    required this.message,
    required this.createdAt,
  });

  final String id;

  final UserModel user;

  final String message;

  @JsonKey(name: 'created_at')
  final String createdAt;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) => _$ChatMessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageModelToJson(this);
}
