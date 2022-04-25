import 'package:covid_overcoming/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(S.current.page_not_found),
          ),
        ),
      ),
    );
  }
}
