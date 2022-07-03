import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/domain/repository/local/local_cache_repository.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:covid_overcoming/presentation/pages/main/chat/bloc/chat_event.dart';
import 'package:covid_overcoming/presentation/pages/main/chat/bloc/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this.firebaseRepository,
    this.localCacheRepository,
  ) : super(ChatInitialState());

  final FirebaseRepository firebaseRepository;
  final LocalCacheRepository localCacheRepository;

  Stream<List<AccountModel>> get accountsStream {
    return firebaseRepository.getAccountsStream();
  }

  Future<AccountModel> get account async {
    return await localCacheRepository.getAccount();
  }
}
