import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_bloc.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_event.dart';
import 'package:covid_overcoming/presentation/pages/auth/bloc/auth_state.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This class is not visible to user
/// It is used for auth provider only
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final AuthBloc _authBloc = getIt<AuthBloc>();

  @override
  void initState() {
    super.initState();
    _authBloc.add(GetCurrentUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (_) => _authBloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        //listenWhen: (prev, curr) => prev.user != curr.user,
        listener: (context, state) {
          if (state.user == null) {
            AuthRouter.goSignIn(context);
          } else {
            // TODO: go to main page
          }
        },
        builder: (context, state) {
          // TODO: set empty page
          return empty;
        },
      ),
    );
  }
}
