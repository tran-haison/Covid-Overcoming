import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    required this.title,
    this.titleTextStyle,
    this.backgroundColor,
    this.centerTitle,
    this.actions,
    this.elevation,
    this.onTap,
  }) : super(key: key);

  final String title;
  final TextStyle? titleTextStyle;
  final Color? backgroundColor;
  final bool? centerTitle;
  final List<Widget>? actions;
  final double? elevation;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleTextStyle ?? textStyle22Medium.copyWith(height: 1.5),
        textAlign: TextAlign.center,
      ),
      backgroundColor: backgroundColor ?? colorWhite,
      elevation: elevation ?? 0.3,
      centerTitle: centerTitle ?? true,
      leading: InkWell(
        borderRadius: BorderRadius.circular(Dimens.radius30),
        onTap: onTap ??
            () {
              NavigatorUtils.goBack(context);
            },
        child: const Icon(
          Icons.arrow_back_ios_rounded,
          color: colorBlack,
        ),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
