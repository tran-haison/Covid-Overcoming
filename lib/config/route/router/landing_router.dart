import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/presentation/pages/landing/onboarding_page.dart';
import 'package:covid_overcoming/presentation/pages/landing/welcome_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class LandingRouter implements IRouterProvider {

  static void goWelcome(BuildContext context) {
    NavigatorUtils.pushReplacement(context, NavigatorPaths.welcome);
  }

  static void goOnBoarding(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.onBoarding);
  }

  @override
  void defineRoutes(FluroRouter router) {
    // Welcome page
    router.define(NavigatorPaths.welcome, handler: Handler(handlerFunc: (_, __) {
      return const WelcomePage();
    }));

    // On-boarding page
    router.define(NavigatorPaths.onBoarding, handler: Handler(handlerFunc: (_, __) {
      return const OnBoardingPage();
    }));  }

}