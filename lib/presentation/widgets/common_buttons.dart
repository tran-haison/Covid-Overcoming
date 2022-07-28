import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/theme.dart';
import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  const CommonElevatedButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.radius = Dimens.radius8,
    this.width,
    this.height,
    this.padding = const EdgeInsets.symmetric(vertical: Dimens.dimen12),
    this.textColor = colorWhite,
    this.buttonColor = colorPrimary,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final double radius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry padding;
  final Color textColor;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all<double>(0),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return buttonColor;
            } else if (states.contains(MaterialState.disabled)) {
              return const Color(0xFFE0E0E0);
            }
            return buttonColor;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
      child: Container(
        width: width,
        height: height,
        padding: padding,
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

class CommonSocialButton extends StatelessWidget {
  const CommonSocialButton({
    Key? key,
    required this.onPressed,
    required this.iconPath,
    this.height = 40,
    this.width = 40,
  }) : super(key: key);

  final Function() onPressed;
  final String iconPath;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onPressed,
      child: CommonAssetIcon(
        iconPath: iconPath,
        width: width,
        height: height,
      ),
    );
  }
}
