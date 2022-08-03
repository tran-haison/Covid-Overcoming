import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/data/model/chat/chat_message_model.dart';
import 'package:either_dart/either.dart';

abstract class FirebaseRepository {
  Future<Either<Error, bool>> saveAccount({
    required AccountModel accountModel,
    required bool shouldReplace,
  });

  Future<Either<Error, AccountModel>> getAccount(String uid);

  Future<Either<Error, bool>> checkAccountExists(String uid);

  Stream<List<AccountModel>> getAccountsStream();

  Stream<List<AccountModel>> getAccountsStreamByRole(AccountRole role);

  Stream<List<ChatMessageModel>> getChatMessagesStream({
    required String groupChatId,
    required int limit,
  });

  Future<Either<Error, bool>> sendChatMessage({
    required String groupChatId,
    required ChatMessageModel chatMessageModel,
  });
}
