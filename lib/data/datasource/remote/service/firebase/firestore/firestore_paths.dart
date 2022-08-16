class FirestorePaths {
  static String accounts() => 'accounts';

  static String account(String uid) => 'accounts/$uid';

  static String messages(String groupChatId) =>
      'messages/$groupChatId/$groupChatId';

  static String message(String groupChatId, String createdAt) =>
      'messages/$groupChatId/$groupChatId/$createdAt';

  static String examinations() => 'examinations';

  static String examination(String id) => 'examinations/$id';

  static String rule(String id) => 'rules/$id';

  static String ruleKnowledges(String ruleId) => 'rules/$ruleId/knowledges';

  static String ruleSubRules(String ruleId) => 'rules/$ruleId/sub-rules';
}
