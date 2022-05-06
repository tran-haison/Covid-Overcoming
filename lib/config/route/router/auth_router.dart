import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/presentation/pages/auth/forgotpassword/forgot_password_page.dart';
import 'package:covid_overcoming/presentation/pages/auth/signin/sign_in_page.dart';
import 'package:covid_overcoming/presentation/pages/auth/signup/sign_up_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AuthRouter implements IRouterProvider {

  static void goSignIn(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.signIn);
  }

  static void goSignUp(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.signUp);
  }

  static void goForgotPassword(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.forgotPassword);
  }

  @override
  void defineRoutes(FluroRouter router) {
    // Sign-in page
    router.define(NavigatorPaths.signIn, handler: Handler(handlerFunc: (_, __) {
      return const SignInPage();
    }));

    // Sign-up page
    router.define(NavigatorPaths.signUp, handler: Handler(handlerFunc: (_, __) {
      return const SignUpPage();
    }));

    // Forgot-password page
    router.define(NavigatorPaths.forgotPassword, handler: Handler(handlerFunc: (_, __) {
      return const ForgotPasswordPage();
    }));
  }

}