import 'package:covid_overcoming/config/logger/logger.dart';
import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/config/route/router/landing_router.dart';
import 'package:covid_overcoming/config/route/ui/page_not_found.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:fluro/fluro.dart';

final router = FluroRouter();

void configureRoutes() {
  // Return to page not found if route error
  router.notFoundHandler = Handler(handlerFunc: (_, __) {
    logger.e(Strings.pageNotFound);
    return const PageNotFound();
  });

  // Init routers and define routes
  AuthRouter().defineRoutes(router);
  LandingRouter().defineRoutes(router);

}
