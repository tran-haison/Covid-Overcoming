import 'dart:math';

import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';

Future showCommonDialog(
  BuildContext context,
  String titleText,
  String messageText, {
  bool dismissible = false,
  String firstButtonText = Strings.ok,
  Color firstButtonColor = colorPrimary,
  VoidCallback? firstButtonCallback,
  String? secondButtonText,
  Color secondButtonColor = colorWhite,
  VoidCallback? secondButtonCallback,
}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (BuildContext context) => CommonDialog(
      title: titleText,
      message: messageText,
      firstButtonText: firstButtonText,
      firstButtonCallback: firstButtonCallback,
      firstButtonColor: firstButtonColor,
      secondButtonText: secondButtonText,
      secondButtonColor: secondButtonColor,
      secondButtonCallback: secondButtonCallback,
    ),
  );
}

Future showToastDialog(
  BuildContext context,
  String title,
  String message, {
  bool dismissible = false,
}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissible,
    builder: (BuildContext context) => ToastDialog(
      title: title,
      message: message,
    ),
  );
}

class CommonDialog extends StatelessWidget {
  final String title;
  final String message;
  final String firstButtonText;
  final Color firstButtonColor;
  final Function()? firstButtonCallback;
  final String? secondButtonText;
  final Color? secondButtonColor;
  final Function()? secondButtonCallback;

  const CommonDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.firstButtonText,
    required this.firstButtonColor,
    this.firstButtonCallback,
    this.secondButtonText,
    this.secondButtonCallback,
    this.secondButtonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var dialogWidth = min<double>(width * 0.86, 400);
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorWhite,
        ),
        width: dialogWidth,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorWhite,
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  message,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF868F95),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Row(
                children: [
                  if (secondButtonText != null)
                    Expanded(
                      child: CommonElevatedButton(
                        onPressed: secondButtonCallback ??
                            () {
                              Navigator.of(context).pop();
                            },
                        text: secondButtonText ?? '',
                      ),
                    ),
                  if (secondButtonText != null) const SizedBox(width: 10),
                  Expanded(
                    child: CommonElevatedButton(
                      onPressed: firstButtonCallback ??
                          () {
                            Navigator.of(context).pop();
                          },
                      text: firstButtonText,
                      textColor: colorWhite,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToastDialog extends StatelessWidget {
  final String title;
  final String message;

  const ToastDialog({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var dialogWidth = min<double>(width * 0.86, 400);
    return Dialog(
      insetPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorWhite,
        ),
        width: dialogWidth,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colorWhite,
          ),
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Color(0xFF515151),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF868F95),
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 36),
              Row(
                children: [
                  Expanded(
                    child: CommonElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      text: Strings.ok,
                      textColor: colorBlack,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
