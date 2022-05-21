import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/ui/page_loading.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/sign_in_page.dart';
import 'package:covid_overcoming/presentation/pages/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This page is not visible to user
/// It is used for auth provider only
class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final AuthBloc _authBloc = getIt<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => _authBloc,
      child: StreamBuilder<User?>(
        stream: _authBloc.onAuthStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;
            if (user == null) {
              return const SignInPage();
            }
            return const MainPage();
          }
          return const PageLoading();
        },
      ),
    );
  }
}
