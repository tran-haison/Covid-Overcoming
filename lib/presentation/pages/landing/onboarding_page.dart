import 'package:covid_overcoming/config/route/router/auth_router.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dimen25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      S.current.features,
                      style: textStyle40Bold,
                    ),
                    Text(
                      S.current.features_description,
                      style: textStyle14Gray,
                      textAlign: TextAlign.center,
                    ),
                    vGap40,
                    _buildFeatureItem(
                      AssetPaths.icHeartMonitor,
                      S.current.recovery_tracking,
                      S.current.recovery_tracking_description,
                    ),
                    vGap20,
                    _buildFeatureItem(
                      AssetPaths.icExercise,
                      S.current.exercise_provider,
                      S.current.exercise_provider_description,
                    ),
                    vGap20,
                    _buildFeatureItem(
                      AssetPaths.icTest,
                      S.current.test_system,
                      S.current.test_system_description,
                    ),
                    vGap20,
                    _buildFeatureItem(
                      AssetPaths.icContact,
                      S.current.expert_connection,
                      S.current.expert_connection_description,
                    ),
                  ],
                ),
              ),
              CommonElevatedButton(
                text: S.current.start,
                onPressed: () => AuthRouter.goAuth(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String iconPath, String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CommonAssetIcon(iconPath: iconPath),
        hGap22,
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: textStyle16Medium,
              ),
              Text(
                content,
                style: textStyle12Gray,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
