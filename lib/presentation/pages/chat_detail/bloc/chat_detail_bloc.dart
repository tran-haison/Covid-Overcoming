import 'package:bloc/bloc.dart';
import 'package:covid_overcoming/core/error/error.dart';
import 'package:covid_overcoming/data/model/chat/chat_message_model.dart';
import 'package:covid_overcoming/domain/repository/remote/firebase/firebase_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'chat_detail_event.dart';

part 'chat_detail_state.dart';

@injectable
class ChatDetailBloc extends Bloc<ChatDetailEvent, ChatDetailState> {
  ChatDetailBloc(
    this._firebaseRepository,
  ) : super(ChatDetailInitialState()) {
    on<ChatDetailSendMessageEvent>(_onChatDetailSendMessageEvent);
  }

  final FirebaseRepository _firebaseRepository;

  Stream<List<ChatMessageModel>> getChatMessagesStream(
    String groupChatId,
    int limit,
  ) {
    return _firebaseRepository.getChatMessagesStream(
      groupChatId: groupChatId,
      limit: limit,
    );
  }

  Future<void> _onChatDetailSendMessageEvent(
    ChatDetailSendMessageEvent event,
    Emitter emit,
  ) async {
    emit(ChatDetailSendMessageLoadingState());

    final res = await _firebaseRepository.sendChatMessage(
      groupChatId: event.groupChatId,
      chatMessageModel: event.chatMessageModel,
    );

    if (res.isRight) {
      emit(const ChatDetailSendMessageSuccessState());
    } else {
      emit(ChatDetailSendMessageFailedState(res.left));
    }
  }
}
