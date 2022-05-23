import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/ui/page_loading.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/sign_in_page.dart';
import 'package:covid_overcoming/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This page is not visible to user
/// It is used for auth provider only
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with BaseStateMixin<AuthPage> {
  final _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: _authBloc,
      builder: (context, state) {
        if (state is AuthGetCurrentUserFailedState) {
          return const SignInPage();
        }
        if (state is AuthGetCurrentUserSuccessState) {
          return const MainPage();
        }
        return const PageLoading();
      },
    );
  }
}
