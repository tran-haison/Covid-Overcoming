import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/main/schedule/bloc/schedule_bloc.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {
  final _scheduleBloc = getIt<ScheduleBloc>();

  // TODO: add load more list account
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ScheduleBloc>(
      create: (_) => _scheduleBloc,
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
    return StreamBuilder<List<AccountModel>>(
      stream: _scheduleBloc.accountsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final accounts = snapshot.data;
          if (accounts != null && accounts.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: accounts.length,
              itemBuilder: (context, index) => _buildSingleAccount(
                accounts[index],
              ),
              controller: _scrollController,
            );
          }
          return Center(
            child: Text(S.current.no_user_found),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _buildSingleAccount(AccountModel accountModel) {
    final photoUrl = accountModel.photoUrl;
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
                    accountModel.name,
                    style: textStyle16Medium,
                  ),
                  vGap5,
                  Text(
                    accountModel.email,
                    style: textStyle12Gray,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
