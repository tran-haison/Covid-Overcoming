// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photo_url'] as String,
      birthday: json['birthday'] as String,
      gender: json['gender'] as String,
      role: json['role'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'photo_url': instance.photoUrl,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'role': instance.role,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
