import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/data/datasource/mock/mock_data.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_event.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_state.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_dialogs.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with BaseStateMixin<ProfilePage> {
  final _profileBloc = getIt<ProfileBloc>();

  @override
  void initState() {
    super.initState();
    _profileBloc.add(ProfileGetLocalAccountEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (_) => _profileBloc,
      child: BlocListener<ProfileBloc, ProfileState>(
        listenWhen: (_, state) => state is ProfileSignOutState,
        listener: (context, state) {
          if (state is ProfileSignOutLoadingState) {
            showLoadingProgress();
            return;
          }
          hideLoadingProgress();

          if (state is ProfileSignOutSuccessState) {
            AuthRouter.goSignIn(context);
            return;
          }

          if (state is ProfileSignOutFailedState) {
            showCommonDialog(
              context,
              Strings.error,
              state.error.message,
            );
            return;
          }
        },
        child: _buildPage(),
      ),
    );
  }

  Widget _buildPage() {
    return Scaffold(
      appBar: CommonAppBar(
        title: S.current.profile,
        elevation: 0.3,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dimen20),
          child: Column(
            children: <Widget>[
              vGap10,
              _buildAccountInfoHeader(),
              vGap30,
              _buildListActionItems(),
              vGap30,
              _buildButtonSignOut(),
              vGap10,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountInfoHeader() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (_, state) => state is ProfileGetLocalAccountState,
      builder: (context, state) {
        if (state is ProfileGetLocalAccountLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final account = state.accountModel;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CommonAvatar(
              photoUrl: account?.photoUrl,
              height: Dimens.dimen100,
              width: Dimens.dimen100,
              padding: 5,
            ),
            vGap15,
            Text(
              account?.name ?? S.current.name,
              style: textStyle26Bold,
            ),
            vGap5,
            Text(
              account?.email ?? S.current.email,
              style: textStyle14Gray,
            ),
            vGap30,
            _buildAccountStats(),
            vGap30,
            _buildSingleActionItem(
              iconPath: AssetPaths.icCheck,
              text: S.current.expert_certified_title,
              onTap: () {},
            ),
            //_buildExpertCertified(),
          ],
        );
      },
    );
  }

  Widget _buildAccountStats() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: _buildAccountSingleStat(MockData.stage, S.current.stage),
        ),
        Expanded(
          child: _buildAccountSingleStat(
            MockData.testsPassed,
            S.current.tests_passed,
          ),
        ),
        Expanded(
          child: _buildAccountSingleStat(MockData.day, S.current.days),
        ),
      ],
    );
  }

  Widget _buildAccountSingleStat(String value, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          value,
          style: textStyle16Bold,
        ),
        vGap4,
        Text(
          text,
          style: textStyle14Gray,
        )
      ],
    );
  }

  Widget _buildListActionItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTextSection(S.current.personal),
        vGap10,
        _buildSingleActionItem(
          iconPath: AssetPaths.icEdit,
          text: S.current.edit_profile,
          onTap: () {},
        ),
        vGap10,
        _buildSingleActionItem(
          iconPath: AssetPaths.icPassword,
          text: S.current.change_password,
          onTap: () {},
        ),
        vGap10,
        _buildSingleActionItem(
          iconPath: AssetPaths.icNotification,
          text: S.current.notification,
          onTap: () {},
        ),
        vGap30,
        _buildTextSection(S.current.help),
        vGap10,
        _buildSingleActionItem(
          iconPath: AssetPaths.icSettings,
          text: S.current.settings,
          onTap: () {},
        ),
        vGap10,
        _buildSingleActionItem(
          iconPath: AssetPaths.icFeedback,
          text: S.current.feedback,
          onTap: () {},
        ),
        vGap10,
        _buildSingleActionItem(
          iconPath: AssetPaths.icPrivacy,
          text: S.current.privacy_policy,
          onTap: () {},
        ),
        vGap10,
        _buildSingleActionItem(
          iconPath: AssetPaths.icVersion,
          text: S.current.version,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildTextSection(String text) {
    return Text(
      text,
      style: textStyle18Medium,
    );
  }

  Widget _buildSingleActionItem({
    required String iconPath,
    required String text,
    required VoidCallback onTap,
    String? trailingText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(Dimens.dimen15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.radius8),
            //color: colorGray100,
            border: Border.all(
              color: colorGray200,
              width: 1,
            ),
          ),
          child: CommonAssetIcon(iconPath: iconPath),
        ),
        hGap10,
        Expanded(
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(Dimens.radius8),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(Dimens.dimen15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.radius8),
                // color: colorGray100,
                border: Border.all(
                  color: colorGray200,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      text,
                      style: textStyle16Medium,
                    ),
                  ),
                  hGap10,
                  if (trailingText != null && trailingText.isNotEmpty)
                    Text(
                      trailingText,
                      style: textStyle16Medium,
                    ),
                  if (trailingText == null)
                    const CommonAssetIcon(
                      iconPath: AssetPaths.icArrowRight,
                      color: colorDarkGray1,
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtonSignOut() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radius30),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.dimen30,
          vertical: Dimens.dimen8,
        ),
      ),
      onPressed: () {
        _profileBloc.add(ProfileSignOutEvent());
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.exit_to_app, color: colorRed1),
          hGap5,
          Text(
            S.current.sign_out,
            style: textStyle14Medium.copyWith(
              color: colorRed1,
            ),
          ),
        ],
      ),
    );
  }
}
