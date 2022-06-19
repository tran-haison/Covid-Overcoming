// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatMessageModel _$ChatMessageModelFromJson(Map<String, dynamic> json) =>
    ChatMessageModel(
      id: json['id'] as String,
      account: AccountModel.fromJson(json['account'] as Map<String, dynamic>),
      message: json['message'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$ChatMessageModelToJson(ChatMessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account': instance.account,
      'message': instance.message,
      'created_at': instance.createdAt,
    };
