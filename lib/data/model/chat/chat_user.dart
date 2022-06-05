import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_user.freezed.dart';

part 'chat_user.g.dart';

@freezed
class ChatUser with _$ChatUser {
  const factory ChatUser({
    required String id,
    required String photoUrl,
    required String displayName,
    required String phoneNumber,
    required String aboutMe,
  }) = _ChatUser;

  factory ChatUser.fromJson(Map<String, dynamic> json) =>
      _$ChatUserFromJson(json);
}
