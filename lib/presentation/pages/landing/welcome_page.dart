import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
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
                      const Text(
                        // TODO: add i10n
                        'Welcome,',
                        style: textStyle40Bold,
                      ),
                      vGap10,
                      const Text(
                        // TODO: add i10n
                        'We believe that everyone who used to be infected with Coronavirus and is suffering from post-Covid effects can recover and return to normal life, by listening to advice, tracking stats and living a healthy life',
                        style: textStyle12Gray,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              CommonElevatedButton(
                // TODO: add i10n
                text: 'Continue',
                onPressed: () {
                  // TODO: go on boarding
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
