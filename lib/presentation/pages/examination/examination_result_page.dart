import 'package:covid_overcoming/config/route/router/main_router.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class ExaminationResultPage extends StatefulWidget {
  const ExaminationResultPage({
    Key? key,
    required this.isAssessmentPassed,
  }) : super(key: key);

  final bool isAssessmentPassed;

  @override
  State<ExaminationResultPage> createState() => _ExaminationResultPageState();
}

class _ExaminationResultPageState extends State<ExaminationResultPage>
    with BaseStateMixin<ExaminationResultPage> {
  late bool isAssessmentPassed;

  @override
  void initState() {
    super.initState();
    isAssessmentPassed = widget.isAssessmentPassed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Result',
        titleTextStyle: textStyle18Medium.copyWith(height: 1.5),
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dimen15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          vGap15,
          Expanded(
            child: Column(
              children: <Widget>[
                _buildTextTitleResult(),
                _buildImageResult(),
                _buildTextContentResult(),
                vGap15,
                _buildButtonResult(),
              ],
            ),
          ),
          vGap15,
          _buildButtonHome(),
          vGap15,
        ],
      ),
    );
  }

  Widget _buildTextTitleResult() {
    return Text(
      isAssessmentPassed ? 'CONGRATULATION' : 'SORRY',
      style: textStyle18Medium.copyWith(letterSpacing: 2),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildImageResult() {
    return CommonAssetImage(
      width: 250,
      height: 250,
      imagePath:
          isAssessmentPassed ? AssetPaths.imgSuccess : AssetPaths.imgFailed,
    );
  }

  Widget _buildTextContentResult() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.dimen15),
      child: Text(
        isAssessmentPassed
            ? 'You have successfully passed the assessment! Now you can return to exercise'
            : 'You did not pass the assessment. Please contact a doctor for support and try again later',
        style: const TextStyle(
          fontSize: Dimens.fontSize14,
          fontWeight: FontWeight.normal,
          color: colorTextGray,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildButtonResult() {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.radius30),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.dimen30,
          vertical: Dimens.dimen5,
        ),
      ),
      onPressed: () {},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            isAssessmentPassed ? 'Share' : 'Request support',
          ),
          hGap10,
          CommonAssetIcon(
            color: colorPrimary,
            width: Dimens.dimen15,
            height: Dimens.dimen15,
            iconPath:
                isAssessmentPassed ? AssetPaths.icShare : AssetPaths.icSupport,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonHome() {
    return CommonElevatedButton(
      text: 'Back to Home',
      radius: Dimens.radius30,
      onPressed: () {
        MainRouter.popUntilMain(context);
      },
    );
  }
}
