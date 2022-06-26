// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      idFrom: json['id_from'] as String,
      idTo: json['id_to'] as String,
      message: json['message'] as String,
      createdAt: json['created_at'] as String,
      type: json['type'] as int,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'id_from': instance.idFrom,
      'id_to': instance.idTo,
      'message': instance.message,
      'created_at': instance.createdAt,
      'type': instance.type,
    };
