import 'package:covid_overcoming/config/logger/logger.dart';
import 'package:covid_overcoming/config/route/routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class NavigatorUtils {

  static Future<dynamic> push(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.native,
    Object? sendData,
  }) async {
    unFocus();
    return await router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      routeSettings: sendData != null
          ? RouteSettings(arguments: sendData)
          : null,
    );
  }

  static void replace(
    BuildContext context,
    String path, {
    Object? sendData,
    TransitionType transition = TransitionType.native,
  }) {
    push(
      context,
      path,
      replace: true,
      sendData: sendData,
      transition: transition,
    );
  }

  static void pushResult(
    BuildContext context,
    String path,
    Function(Object?) onResult, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.native,
    Object? sendData,
  }) {
    unFocus();
    router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      routeSettings: sendData != null
          ? RouteSettings(arguments: sendData)
          : null,
    )
        .then<dynamic>((Object? result) => onResult.call(result))
        .catchError((dynamic error) => logger.e('$error'));
  }

  static void goBack(BuildContext context) {
    unFocus();
    router.pop<dynamic>(context);
  }

  static void goBackWithParams(BuildContext context, Object result) {
    unFocus();
    router.pop(context, result);
  }

  static Future<dynamic> pushWidget(
      BuildContext context,
      WidgetBuilder builder,
      ) {
    return Navigator.of(context).push<dynamic>(
      MaterialPageRoute<dynamic>(builder: builder),
    );
  }

  static void popRoot(BuildContext context, {Object? result}) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop(result);
    }
  }

  static void popUntilRouter(BuildContext context, String path) {
    Navigator.of(context).popUntil((route) => route.settings.name == path);
  }

  static void unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
