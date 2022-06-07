import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_role_model.g.dart';

@JsonSerializable()
class UserRoleModel {
  const UserRoleModel({
    required this.id,
    required this.role,
  });

  final String id;

  final String role;

  factory UserRoleModel.fromJson(Map<String, dynamic> json) =>
      _$UserRoleModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserRoleModelToJson(this);

  UserRoleType getRoleType(String value) {
    return UserRoleExtension.toUserRoleType(value);
  }
}

enum UserRoleType { user, expert }

extension UserRoleExtension on UserRoleType {
  String toUserRoleTypeString() {
    switch (this) {
      case UserRoleType.user:
        return 'user';
      case UserRoleType.expert:
        return 'expert';
    }
  }

  static UserRoleType toUserRoleType(String value) {
    return UserRoleType.values.firstWhere(
      (type) => type.toUserRoleTypeString() == value,
    );
  }
}
