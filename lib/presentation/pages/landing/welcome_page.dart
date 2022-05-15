import 'package:covid_overcoming/config/route/router/landing_router.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dimen25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CommonAssetImage(
                        imagePath: AssetPaths.imgWelcome,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.7,
                      ),
                      vGap10,
                      const Text(Strings.appName),
                      Text(
                        S.current.welcome,
                        style: textStyle40Bold,
                      ),
                      vGap10,
                      Text(
                        S.current.welcome_description,
                        style: textStyle12Gray,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              CommonElevatedButton(
                text: S.current.continue_,
                onPressed: () => LandingRouter.goOnBoarding(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
