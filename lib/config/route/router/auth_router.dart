import 'package:covid_overcoming/config/route/navigator_utils.dart';
import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/presentation/pages/auth/forgotpassword/forgot_password_page.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/sign_in_page.dart';
import 'package:covid_overcoming/presentation/pages/auth/signup/sign_up_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

const _signIn = '/sign-in';
const _signUp = '/sign-up';
const _forgotPassword = '/forgot-password';

class AuthRouter implements IRouterProvider {

  static void goSignIn(BuildContext context) {
    NavigatorUtils.replace(context, _signIn);
  }

  static void goSignUp(BuildContext context) {
    NavigatorUtils.push(context, _signUp);
  }

  static void goForgotPassword(BuildContext context) {
    NavigatorUtils.push(context, _forgotPassword);
  }

  @override
  void defineRoutes(FluroRouter router) {
    // Sign-in page
    router.define(_signIn, handler: Handler(handlerFunc: (_, __) {
      return const SignInPage();
    }));

    // Sign-up page
    router.define(_signUp, handler: Handler(handlerFunc: (_, __) {
      return const SignUpPage();
    }));

    // Forgot-password page
    router.define(_forgotPassword, handler: Handler(handlerFunc: (_, __) {
      return const ForgotPasswordPage();
    }));
  }

}