import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_dialogs.dart';
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
  final _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state is AuthSignOutLoadingState) {
          showLoadingProgress();
          return;
        }
        hideLoadingProgress();

        if (state is AuthSignOutSuccessState) {
          AuthRouter.goSignIn(context);
          return;
        }

        if (state is AuthSignOutFailedState) {
          showCommonDialog(
            context,
            Strings.error,
            state.error.message,
          );
          return;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: CommonElevatedButton(
              text: S.current.sign_out,
              height: 60,
              width: 120,
              onPressed: () {
                _authBloc.add(AuthSignOutEvent());
              },
            ),
          ),
        ),
      ),
    );
  }
}
