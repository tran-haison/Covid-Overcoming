import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_chat_service.dart';
import 'package:covid_overcoming/data/datasource/remote/service/firebase/firestore/firestore_database_service.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/data/model/chat/chat_message_model.dart';
import 'package:covid_overcoming/data/repository/utils/data_constants.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FirebaseRepository)
class FirebaseRepositoryImpl implements FirebaseRepository {
  const FirebaseRepositoryImpl(
    this.fireStoreDatabase,
    this.fireStoreChatService,
  );

  final FirestoreDatabaseService fireStoreDatabase;
  final FirestoreChatService fireStoreChatService;

  @override
  Future<Either<Error, bool>> saveAccount({
    required AccountModel accountModel,
    required bool shouldReplace,
  }) async {
    return _firebaseMethodCall<bool>(
      function: () async {
        final isAccountExisted = await fireStoreDatabase.checkAccountExists(
          accountModel.uid,
        );
        if (!isAccountExisted || (isAccountExisted && shouldReplace)) {
          await fireStoreDatabase.saveAccount(accountModel);
          return const Right(true);
        }
        return const Right(false);
      },
      errorMessage: DataConstants.errorSaveAccount,
    );
  }

  @override
  Future<Either<Error, AccountModel>> getAccount(String uid) async {
    return _firebaseMethodCall<AccountModel>(
      function: () async => Right(await fireStoreDatabase.getAccount(uid)),
      errorMessage: DataConstants.errorGetAccount,
    );
  }

  @override
  Future<Either<Error, bool>> checkAccountExists(String uid) async {
    return _firebaseMethodCall<bool>(
      function: () async => Right(
        await fireStoreDatabase.checkAccountExists(uid),
      ),
      errorMessage: DataConstants.errorCheckAccountExists,
    );
  }

  @override
  Stream<List<AccountModel>> getAccountsStream() {
    return fireStoreDatabase.getAccountsStream();
  }

  @override
  Stream<List<AccountModel>> getAccountsStreamByRole(AccountRole role) {
    return fireStoreDatabase.getAccountsStreamByRole(role);
  }

  @override
  Stream<List<ChatMessageModel>> getChatMessagesStream({
    required String groupChatId,
    required int limit,
  }) {
    return fireStoreChatService.getChatMessagesStream(
      groupChatId: groupChatId,
      limit: limit,
    );
  }

  @override
  Future<Either<Error, bool>> sendChatMessage({
    required String groupChatId,
    required ChatMessageModel chatMessageModel,
  }) {
    return _firebaseMethodCall<bool>(
      function: () async {
        await fireStoreChatService.sendChatMessage(
          groupChatId: groupChatId,
          chatMessageModel: chatMessageModel,
        );
        return const Right(true);
      },
      errorMessage: DataConstants.errorSendChatMessage,
    );
  }

  /// Generic function with error handling for firebase methods
  Future<Either<Error, T>> _firebaseMethodCall<T>({
    required Future<Either<Error, T>> Function() function,
    required String errorMessage,
  }) async {
    try {
      return function();
    } catch (e) {
      Log.e('$errorMessage\n${e.toString()}');
      return Left(FirebaseError(errorMessage));
    }
  }
}
