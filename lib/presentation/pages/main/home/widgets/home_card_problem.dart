import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class HomeCardProblem extends StatelessWidget {
  const HomeCardProblem({
    Key? key,
    required this.title,
    required this.content,
    required this.iconPath,
    required this.cardColor,
    required this.iconBackgroundColor,
    required this.titleColor,
    required this.contentColor,
    required this.onTap,
    this.elevation = 0,
  }) : super(key: key);

  final String title;
  final String content;
  final String iconPath;
  final Color cardColor;
  final Color iconBackgroundColor;
  final Color titleColor;
  final Color contentColor;
  final VoidCallback onTap;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.radius10),
      ),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: 150,
          height: 150,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.dimen15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.radius30),
                    color: iconBackgroundColor,
                  ),
                  padding: const EdgeInsets.all(Dimens.dimen10),
                  child: CommonAssetIcon(iconPath: iconPath),
                ),
                vGap10,
                Text(
                  title,
                  style: textStyle16Bold.copyWith(color: titleColor),
                ),
                Text(
                  content,
                  style: textStyle12LightGray.copyWith(color: contentColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
