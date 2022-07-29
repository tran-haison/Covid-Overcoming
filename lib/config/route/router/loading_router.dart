import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/config/route/ui/page_loading.dart';
import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class LoadingRouter implements IRouterProvider {
  static void goLoading(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.loading);
  }

  @override
  void defineRoutes(FluroRouter router) {
    // Loading page
    router.define(
      NavigatorPaths.loading,
      handler: Handler(handlerFunc: (_, __) {
        return const PageLoading();
      }),
    );
  }
}
