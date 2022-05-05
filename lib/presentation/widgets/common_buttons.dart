import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/theme.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.radius,
    this.width,
    this.height,
    this.padding,
    this.textColor = colorWhite,
    this.buttonColor = colorPrimary,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final double? radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return buttonColor;
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.grey;
            }
            return buttonColor;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 8),
          ),
        ),
      ),
      child: Container(
        width: width,
        height: height,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: Text(
            text,
            style: context.headline6.copyWith(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
