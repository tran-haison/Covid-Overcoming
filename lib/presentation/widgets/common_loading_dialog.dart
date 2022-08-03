import 'package:covid_overcoming/config/log/logger.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

bool _isShowDialog = false;

Future<void> showLoadingDialog({required BuildContext context}) async {
  try {
    if (_isShowDialog) return;
    _isShowDialog = true;

    await showTransparentDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            return Future.value(false);
          },
          child: const ProgressDialog(),
        );
      },
    ).then((value) {
      _isShowDialog = false;
    });
  } catch (e) {
    Log.e(e.toString());
  }
}

void hideLoadingDialog({required BuildContext context}) {
  if (_isShowDialog) {
    Navigator.of(context, rootNavigator: true).pop();
    _isShowDialog = false;
  }
}

Future<T?> showTransparentDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  bool barrierDismissible = true,
  bool useRootNavigator = true,
  Color? barrierColor,
}) async {
  final ThemeData theme = Theme.of(context);
  return showGeneralDialog(
    context: context,
    pageBuilder: (
      BuildContext buildContext,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return Theme(data: theme, child: pageChild);
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: barrierColor ?? const Color(0x00FFFFFF),
    transitionDuration: const Duration(milliseconds: 150),
    useRootNavigator: useRootNavigator,
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

class ProgressDialog extends Dialog {
  const ProgressDialog({
    Key? key,
    this.hintText = '',
  }) : super(key: key);

  final String hintText;

  @override
  Widget build(BuildContext context) {
    final Widget progress = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: ThemeData(
            cupertinoOverrideTheme: const CupertinoThemeData(
              brightness: Brightness.light,
            ),
          ),
          child: const CircularProgressIndicator.adaptive(
            backgroundColor: colorWhite,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          S.current.loading,
          style: const TextStyle(
            color: colorWhite,
          ),
        ),
      ],
    );

    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          height: 120,
          width: 120,
          decoration: ShapeDecoration(
            gradient: const LinearGradient(
              colors: [
                colorPurple3,
                colorPrimary,
              ],
            ),
            //color: colorSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: progress,
        ),
      ),
    );
  }
}
