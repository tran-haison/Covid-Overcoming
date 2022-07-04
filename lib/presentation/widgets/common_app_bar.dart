import 'package:covid_overcoming/config/route/utils/navigator_utils.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    required this.title,
    this.titleTextStyle = textStyle22Medium,
    this.backgroundColor = colorWhite,
    this.centerTitle = true,
    this.actions,
    this.elevation = 0,
  }) : super(key: key);

  final String title;
  final TextStyle titleTextStyle;
  final Color backgroundColor;
  final bool centerTitle;
  final List<Widget>? actions;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: titleTextStyle,
        textAlign: TextAlign.center,
      ),
      backgroundColor: backgroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      leading: InkWell(
        borderRadius: BorderRadius.circular(Dimens.radius30),
        onTap: () {
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
