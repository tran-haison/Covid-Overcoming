import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/presentation/pages/examination/examination_page.dart';
import 'package:fluro/fluro.dart';
import 'package:fluro/src/fluro_router.dart';
import 'package:flutter/material.dart';

class ExaminationRouter implements IRouterProvider {
  static void goExamination(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.examination);
  }

  @override
  void defineRoutes(FluroRouter router) {
    // Examination page
    router.define(
      NavigatorPaths.examination,
      handler: Handler(handlerFunc: (_, __) {
        return const ExaminationPage();
      }),
    );
  }
}
