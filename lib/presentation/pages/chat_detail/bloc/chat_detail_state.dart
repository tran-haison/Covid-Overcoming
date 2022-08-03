part of 'chat_detail_bloc.dart';

abstract class ChatDetailState extends Equatable {
  const ChatDetailState();

  @override
  List<Object?> get props => [];
}

class ChatDetailInitialState extends ChatDetailState {}

class ChatDetailSendMessageLoadingState extends ChatDetailState {}

class ChatDetailSendMessageSuccessState extends ChatDetailState {
  const ChatDetailSendMessageSuccessState();
}

class ChatDetailSendMessageFailedState extends ChatDetailState {
  const ChatDetailSendMessageFailedState(this.error);

  final Error? error;
}
