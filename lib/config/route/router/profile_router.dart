import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/presentation/pages/profile/profile_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class ProfileRouter implements IRouterProvider {
  static void goProfile(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.profile);
  }

  @override
  void defineRoutes(FluroRouter router) {
    // Profile page
    router.define(
      NavigatorPaths.profile,
      handler: Handler(handlerFunc: (_, __) {
        return const ProfilePage();
      }),
    );
  }
}
