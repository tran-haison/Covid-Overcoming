import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/chat_router.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/main/chat/bloc/chat_bloc.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  final _chatBloc = getIt<ChatBloc>();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      create: (_) => _chatBloc,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Text(
                  S.current.chat,
                  style: textStyle30Medium,
                ),
              ),
              vGap10,
              _buildListAccounts(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListAccounts() {
    return FutureBuilder<AccountModel>(
      future: _chatBloc.account,
      builder: (context, snapshot) {
        final currentAccount = snapshot.data;

        if (currentAccount == null) {
          return empty;
        }

        return StreamBuilder<List<AccountModel>>(
          stream: _chatBloc.accountsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final accounts = snapshot.data;
              if (accounts != null && accounts.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: accounts.length,
                  itemBuilder: (context, index) {
                    final account = accounts[index];

                    if (currentAccount.uid == account.uid) {
                      return empty;
                    }

                    return _buildSingleAccountItem(
                      otherAccount: account,
                      currentAccount: currentAccount,
                    );
                  },
                  controller: _scrollController,
                );
              }
              return Center(
                child: Text(
                  S.current.no_user_found,
                  style: textStyle16Medium,
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }

  Widget _buildSingleAccountItem({
    required AccountModel otherAccount,
    required AccountModel currentAccount,
  }) {
    final photoUrl = otherAccount.photoUrl;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dimen8,
          horizontal: Dimens.dimen20,
        ),
        child: Row(
          children: <Widget>[
            CommonAvatar(
              photoUrl: photoUrl,
              height: Dimens.dimen50,
              width: Dimens.dimen50,
            ),
            hGap22,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    otherAccount.name,
                    style: textStyle16Medium,
                  ),
                  vGap5,
                  Text(
                    otherAccount.email,
                    style: textStyle12Gray,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        ChatRouter.goChatDetail(
          context,
          accountMe: currentAccount,
          accountOther: otherAccount,
        );
      },
    );
  }
}
