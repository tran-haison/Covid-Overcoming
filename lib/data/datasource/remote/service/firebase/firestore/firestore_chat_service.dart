import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_base_service.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_paths.dart';
import 'package:covid_overcoming/data/model/chat/chat_message_model.dart';
import 'package:injectable/injectable.dart';

abstract class FirestoreChatService {
  Stream<List<ChatMessageModel>> getChatMessagesStream({
    required String groupChatId,
    required int limit,
  });

  Future<void> sendChatMessage({
    required String groupChatId,
    required ChatMessageModel chatMessageModel,
  });
}

@LazySingleton(as: FirestoreChatService)
class FirestoreChatServiceImpl implements FirestoreChatService {
  FirestoreChatServiceImpl(this.baseService);

  final FirestoreBaseService baseService;

  @override
  Stream<List<ChatMessageModel>> getChatMessagesStream({
    required String groupChatId,
    required int limit,
  }) {
    return baseService.collectionStream<ChatMessageModel>(
      path: FirestorePaths.messages(groupChatId),
      builder: (data, documentId) => ChatMessageModel.fromJson(data),
      queryBuilder: (query) => query.limit(limit).orderBy(
            'created_at',
            descending: true,
          ),
      // sort: (left, right) => right.createdAtDateTime.compareTo(
      //   left.createdAtDateTime,
      // ),
    );
  }

  @override
  Future<void> sendChatMessage({
    required String groupChatId,
    required ChatMessageModel chatMessageModel,
  }) async {
    await baseService.setData(
      path: FirestorePaths.message(groupChatId, chatMessageModel.createdAt),
      data: chatMessageModel.toJson(),
    );
  }
}
