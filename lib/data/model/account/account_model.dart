import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  const AccountModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
    required this.birthday,
    required this.gender,
    required this.role,
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

  final String role;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  AccountRole get accountRole => AccountRoleExtension.toRoleAccount(role);

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  factory AccountModel.fromUser(User user) {
    return AccountModel(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      photoUrl: user.photoURL ?? '',
      birthday: '',
      gender: '',
      role: AccountRole.user.toRoleString(),
      createdAt: user.metadata.creationTime?.toIso8601String() ??
          DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
  }
}

enum AccountRole { user, expert }

extension AccountRoleExtension on AccountRole {
  String toRoleString() {
    switch (this) {
      case AccountRole.user:
        return 'user';
      case AccountRole.expert:
        return 'expert';
    }
  }

  static AccountRole toRoleAccount(String value) {
    return AccountRole.values.firstWhere(
      (role) => role.toRoleString() == value,
    );
  }
}
