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
    required this.expertRequestStatus,
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

  @JsonKey(name: 'expert_request_status')
  final String expertRequestStatus;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  AccountRole get accountRole => AccountRoleExtension.toAccountRole(role);

  AccountGender get accountGender =>
      AccountGenderExtension.toAccountGender(gender);

  AccountExpertRequestStatus get accountExpertRequestStatus =>
      AccountExpertRequestStatusExtension.toAccountExpertRequestStatus(
        expertRequestStatus,
      );

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
      gender: AccountGender.male.toGenderString(),
      role: AccountRole.user.toRoleString(),
      expertRequestStatus: AccountExpertRequestStatus.none.toStatusString(),
      createdAt: user.metadata.creationTime?.toIso8601String() ??
          DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
    );
  }

  AccountModel copyWith({
    String? uid,
    String? name,
    String? email,
    String? photoUrl,
    String? birthday,
    String? gender,
    String? role,
    String? expertRequestStatus,
    String? createdAt,
    String? updatedAt,
  }) {
    return AccountModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      role: role ?? this.role,
      expertRequestStatus: expertRequestStatus ?? this.expertRequestStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
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

  static AccountRole toAccountRole(String value) {
    return AccountRole.values.firstWhere(
      (role) => role.toRoleString() == value,
    );
  }
}

enum AccountGender { male, female, other }

extension AccountGenderExtension on AccountGender {
  String toGenderString() {
    switch (this) {
      case AccountGender.male:
        return 'male';
      case AccountGender.female:
        return 'female';
      case AccountGender.other:
        return 'other';
    }
  }

  static AccountGender toAccountGender(String value) {
    return AccountGender.values.firstWhere(
      (gender) => gender.toGenderString() == value,
    );
  }
}

enum AccountExpertRequestStatus { none, pending, approve, reject }

extension AccountExpertRequestStatusExtension on AccountExpertRequestStatus {
  String toStatusString() {
    switch (this) {
      case AccountExpertRequestStatus.none:
        return 'none';
      case AccountExpertRequestStatus.pending:
        return 'pending';
      case AccountExpertRequestStatus.approve:
        return 'approve';
      case AccountExpertRequestStatus.reject:
        return 'reject';
    }
  }

  static AccountExpertRequestStatus toAccountExpertRequestStatus(String value) {
    return AccountExpertRequestStatus.values.firstWhere(
      (status) => status.toStatusString() == value,
    );
  }
}
