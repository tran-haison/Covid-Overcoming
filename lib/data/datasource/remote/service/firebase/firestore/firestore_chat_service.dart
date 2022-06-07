import 'package:injectable/injectable.dart';

abstract class FirestoreChatService {}

@LazySingleton(as: FirestoreChatService)
class FirestoreChatServiceImpl implements FirestoreChatService {

}
