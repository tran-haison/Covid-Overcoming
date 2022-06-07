import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.birthday,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
  });

  final String uid;

  final String name;

  final String email;

  @JsonKey(name: 'photo_url')
  final String photoUrl;

  final String birthday;

  final String gender;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
