import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/presentation/pages/main/main_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class MainRouter implements IRouterProvider {
  static void goMain(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.main);
  }

  @override
  void defineRoutes(FluroRouter router) {
    // Main page
    router.define(
      NavigatorPaths.main,
      handler: Handler(handlerFunc: (_, __) {
        return const MainPage();
      }),
    );
  }
}
