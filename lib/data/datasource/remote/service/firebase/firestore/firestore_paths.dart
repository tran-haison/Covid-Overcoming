class FirestorePaths {
  static String accounts() => 'accounts';

  static String account(String uid) => 'accounts/$uid';

  static String messages(String groupChatId) =>
      'messages/$groupChatId/$groupChatId';

  static String message(String groupChatId, String createdAt) =>
      'messages/$groupChatId/$groupChatId/$createdAt';
}
