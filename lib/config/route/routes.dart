import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/config/route/ui/page_not_found.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

final router = FluroRouter();

void configureRoutes() {
  // Return to page not found if route error
  router.notFoundHandler = Handler(handlerFunc: (_, __) {
    debugPrint("Page not found");
    return const PageNotFound();
  });

  // Init routers and define routes
  // TODO(son): define any route here
  AuthRouter().defineRoutes(router);

}
