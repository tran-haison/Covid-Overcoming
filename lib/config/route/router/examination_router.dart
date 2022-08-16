import 'package:covid_overcoming/config/route/router/router_provider.dart';
import 'package:covid_overcoming/config/route/utils/navigator_paths.dart';
import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/presentation/pages/examination/examination_edit_page.dart';
import 'package:covid_overcoming/presentation/pages/examination/examination_page.dart';
import 'package:covid_overcoming/presentation/pages/examination/examination_result_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class ExaminationRouter implements IRouterProvider {
  static void goExamination(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.examination);
  }

  static void goExaminationResult(
    BuildContext context, {
    required bool isAssessmentPassed,
  }) {
    NavigatorUtils.pushReplacement(
      context,
      NavigatorPaths.examinationResult,
      sendData: isAssessmentPassed,
    );
  }

  static void goExaminationEdit(BuildContext context) {
    NavigatorUtils.push(context, NavigatorPaths.examinationEdit);
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

    // ExaminationResult page
    router.define(
      NavigatorPaths.examinationResult,
      handler: Handler(handlerFunc: (context, __) {
        final isAssessmentPassed = context?.settings?.arguments as bool;
        return ExaminationResultPage(
          isAssessmentPassed: isAssessmentPassed,
        );
      }),
    );

    // ExaminationEdit page
    router.define(
      NavigatorPaths.examinationEdit,
      handler: Handler(handlerFunc: (_, __) {
        return const ExaminationEditPage();
      }),
    );
  }
}
