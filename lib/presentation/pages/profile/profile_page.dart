import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/config/route/router/examination_router.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/data/datasource/mock/mock_data.dart';
import 'package:covid_overcoming/data/model/account/account_model.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_bloc.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_event.dart';
import 'package:covid_overcoming/presentation/pages/profile/bloc/profile_state.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
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
      backgroundColor: colorGray100,
      appBar: CommonAppBar(title: S.current.profile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dimen20),
          child: Column(
            children: <Widget>[
              vGap10,
              _buildAccountInfoHeader(),
              vGap20,
              _buildAccountStats(),
              vGap20,
              _buildExpertCertified(),
              vGap30,
              _buildSectionPersonal(),
              vGap30,
              _buildSectionHelp(),
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
        return _buildParentContainer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.dimen20),
            child: Column(
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAccountStats() {
    return _buildParentContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: Dimens.dimen15),
        child: Row(
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
        ),
      ),
    );
  }

  Widget _buildExpertCertified() {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final account = state.accountModel;
        Widget widget;

        switch (account?.accountExpertRequestStatus) {
          case AccountExpertRequestStatus.none:
            widget = CommonElevatedButton(
              text: 'Request to become an expert',
              onPressed: () {
                _profileBloc.add(ProfileRequestToBecomeExpertEvent());
              },
            );
            break;
          case AccountExpertRequestStatus.pending:
            widget = _buildParentContainer(
              child: _buildSingleActionItem(
                iconPath: AssetPaths.icClock,
                text: 'Please wait while your request is reviewed by admin',
                trailingText: '',
              ),
            );
            break;
          case AccountExpertRequestStatus.approve:
            widget = _buildParentContainer(
              child: _buildSingleActionItem(
                iconPath: AssetPaths.icCheck,
                text: 'Expert certified',
                onTap: () {
                  ExaminationRouter.goExaminationEdit(context);
                },
              ),
            );
            break;
          case AccountExpertRequestStatus.reject:
            widget = _buildParentContainer(
              child: _buildSingleActionItem(
                iconPath: AssetPaths.icRejected,
                text: 'Your request has been rejected!',
                trailingText: '',
              ),
            );
            break;
          default:
            widget = empty;
        }

        return widget;
      },
    );
  }

  Widget _buildSectionPersonal() {
    final items = <Widget>[
      _buildSingleActionItem(
        iconPath: AssetPaths.icEdit,
        text: S.current.edit_profile,
        onTap: () {},
      ),
      _buildSingleActionItem(
        iconPath: AssetPaths.icPassword,
        text: S.current.change_password,
        onTap: () {},
      ),
      _buildSingleActionItem(
        iconPath: AssetPaths.icNotification,
        text: S.current.notification,
        onTap: () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextSection(S.current.personal),
        vGap10,
        _buildParentContainer(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, index) {
              return items[index];
            },
            separatorBuilder: (_, __) => vLine,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionHelp() {
    final items = <Widget>[
      _buildSingleActionItem(
        iconPath: AssetPaths.icSettings,
        text: S.current.settings,
        onTap: () {},
      ),
      _buildSingleActionItem(
        iconPath: AssetPaths.icFeedback,
        text: S.current.feedback,
        onTap: () {},
      ),
      _buildSingleActionItem(
        iconPath: AssetPaths.icPrivacy,
        text: S.current.privacy_policy,
        onTap: () {},
      ),
      _buildSingleActionItem(
        iconPath: AssetPaths.icVersion,
        text: S.current.version,
        trailingText: '',
        onTap: () {},
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildTextSection(S.current.help),
        vGap10,
        _buildParentContainer(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (_, index) {
              return items[index];
            },
            separatorBuilder: (_, __) => vLine,
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
        side: const BorderSide(
          color: colorRed1,
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

  Widget _buildParentContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimens.dimen20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radius10),
        color: colorWhite,
        boxShadow: const [
          BoxShadow(
            color: colorGray200,
            blurRadius: 0,
            spreadRadius: 0.5,
          )
        ],
      ),
      child: child,
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

  Widget _buildTextSection(String text) {
    return Text(
      text,
      style: textStyle18Medium,
    );
  }

  Widget _buildSingleActionItem({
    required String iconPath,
    required String text,
    VoidCallback? onTap,
    String? trailingText,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dimen15,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CommonAssetIcon(
              iconPath: iconPath,
              height: Dimens.dimen20,
              width: Dimens.dimen20,
            ),
            hGap15,
            Expanded(
              child: Text(
                text,
                style: textStyle16Medium.copyWith(height: 1.3),
              ),
            ),
            hGap15,
            if (trailingText != null)
              Text(
                trailingText,
                style: textStyle16Medium,
              ),
            if (trailingText == null)
              const CommonAssetIcon(
                height: Dimens.dimen15,
                width: Dimens.dimen15,
                iconPath: AssetPaths.icArrowRight,
              ),
          ],
        ),
      ),
    );
  }
}
