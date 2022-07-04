import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/data/model/chat/chat_message_model.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/chat_detail/bloc/chat_detail_bloc.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_form_field.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/utils/extension/date_extension.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    Key? key,
    required this.accountMe,
    required this.accountOther,
  }) : super(key: key);

  final AccountModel accountMe;
  final AccountModel accountOther;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage>
    with BaseStateMixin<ChatDetailPage> {
  final _chatDetailBloc = getIt<ChatDetailBloc>();
  final _messageController = TextEditingController();
  final _scrollController = ScrollController();

  List<ChatMessageModel> listMessages = [];

  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId = '';

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
    _getGroupChatId();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void _getGroupChatId() {
    final meUid = widget.accountMe.uid;
    final otherUid = widget.accountOther.uid;

    if (meUid.compareTo(otherUid) > 0) {
      groupChatId = '$meUid - $otherUid';
    } else {
      groupChatId = '$otherUid - $meUid';
    }
  }

  void _onSendMessage() {
    final message = _messageController.text;
    if (message.trim().isNotEmpty) {
      _messageController.clear();

      final chatMessageModel = ChatMessageModel(
        idFrom: widget.accountMe.uid,
        idTo: widget.accountOther.uid,
        message: message,
        createdAt: DateTime.now().toIso8601String(),
      );

      _chatDetailBloc.add(ChatDetailSendMessageEvent(
        groupChatId: groupChatId,
        chatMessageModel: chatMessageModel,
      ));

      _scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage();
  }

  Widget _buildPage() {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: CommonAppBar(
        title: widget.accountOther.name,
        elevation: 0.3,
      ),
      body: Column(
        children: <Widget>[
          _buildListMessages(),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildListMessages() {
    return Expanded(
      child: StreamBuilder<List<ChatMessageModel>>(
        stream: _chatDetailBloc.getChatMessagesStream(groupChatId, _limit),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data;

            if (data != null && data.isNotEmpty) {
              listMessages = data;
              return ListView.separated(
                controller: _scrollController,
                padding: const EdgeInsets.all(Dimens.dimen15),
                itemCount: listMessages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return _buildSingleMessage(listMessages[index]);
                },
                separatorBuilder: (_, __) => vGap10,
              );
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CommonAssetImage(
                  imagePath: AssetPaths.imgConversation,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.7,
                ),
                Text(
                  S.current.let_start_your_conversation,
                  style: textStyle16Medium,
                ),
                vGap50,
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildSingleMessage(ChatMessageModel chatMessage) {
    if (chatMessage.idFrom == widget.accountMe.uid) {
      return _buildMessageSend(chatMessage);
    }
    if (chatMessage.idFrom == widget.accountOther.uid) {
      return _buildMessageReceive(chatMessage);
    }
    return empty;
  }

  Widget _buildMessageSend(ChatMessageModel chatMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: _buildMessageBubble(
                message: chatMessage.message,
                backgroundColor: colorPrimary,
                textColor: colorWhite,
              ),
            ),
            hGap10,
            CommonAvatar(
              photoUrl: widget.accountMe.photoUrl,
              height: 30,
              width: 30,
            ),
          ],
        ),
        vGap10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.dimen40),
          child: Text(
            chatMessage.createdAtDateTime.toStringWithFormat(),
            style: textStyle12Gray,
          ),
        ),
      ],
    );
  }

  Widget _buildMessageReceive(ChatMessageModel chatMessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CommonAvatar(
              photoUrl: widget.accountOther.photoUrl,
              height: 30,
              width: 30,
            ),
            hGap10,
            Flexible(
              child: _buildMessageBubble(
                message: chatMessage.message,
                backgroundColor: colorGray100,
                textColor: colorBlack,
              ),
            ),
          ],
        ),
        vGap10,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.dimen40),
          child: Text(
            chatMessage.createdAtDateTime.toStringWithFormat(),
            style: textStyle12Gray,
          ),
        ),
      ],
    );
  }

  Widget _buildMessageBubble({
    required String message,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(Dimens.dimen10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(Dimens.radius10),
      ),
      child: Text(
        message,
        style: textStyle16Medium.copyWith(
          color: textColor,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: colorWhite,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: colorGray200,
          )
        ]
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CommonTextFormField(
              controller: _messageController,
              hintText: S.current.type_here,
              backgroundColor: colorWhite,
              onChanged: (text) {
                // No need to use
              },
            ),
          ),
          hGap10,
          InkWell(
            onTap: _onSendMessage,
            //splashColor: Colors.black12,
            child: Icon(
              Icons.send,
              color: colorPrimary,
            ),
          ),
          hGap10,
        ],
      ),
    );
  }
}
