part of 'chat_detail_bloc.dart';

abstract class ChatDetailEvent extends Equatable {
  const ChatDetailEvent();

  @override
  List<Object?> get props => [];
}

class ChatDetailSendMessageEvent extends ChatDetailEvent {
  const ChatDetailSendMessageEvent({
    required this.groupChatId,
    required this.chatMessageModel,
  });

  final String groupChatId;
  final ChatMessageModel chatMessageModel;
}
