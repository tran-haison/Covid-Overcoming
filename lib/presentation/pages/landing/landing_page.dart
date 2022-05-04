import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Dimens.dimen15,
            horizontal: Dimens.dimen25,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  AssetPaths.imgWelcome,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.7,
                ),
                vGap10,
                Text(Strings.appName),
                Text(
                  'Welcome',
                  style: textStyle.copyWith(fontStyle: FontStyle.normal),
                ),
                vGap20,
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: Dimens.fontSize16,
                      color: colorWhite,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery
                          .of(context)
                          .size
                          .width,
                      50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(Dimens.radius10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
