import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dimen20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            vGap20,
            _buildCardHistory(),
            vGap20,
            _buildTextTitle('Stages'),
            vGap10,
            _buildStages(),
            vGap10,
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                // TODO: implement greeting
                'Good afternoon,',
                style: textStyle14Gray.copyWith(height: 1),
              ),
              vGap5,
              Text(
                // TODO: get user name
                'Tran Hai Son',
                style: textStyle30Bold.copyWith(height: 1),
              ),
            ],
          ),
        ),
        const CommonAssetImage(
          imagePath: AssetPaths.imgHacker,
          height: Dimens.dimen40,
          width: Dimens.dimen40,
        ),
      ],
    );
  }

  Widget _buildCardHistory() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radius10),
        color: colorPrimary,
      ),
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dimen15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const CommonAssetImage(
              imagePath: AssetPaths.imgTrackHistory,
              height: 90,
              width: 90,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'STAGE 3',
                    style: textStyle16Medium.copyWith(color: colorWhite),
                  ),
                  Text(
                    'Keep up the good work!',
                    style: textStyle12LightGray,
                  ),
                  vGap10,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CommonElevatedButton(
                      text: S.current.continue_,
                      textColor: colorPrimary,
                      buttonColor: colorWhite,
                      width: 120,
                      radius: 30,
                      padding: const EdgeInsets.symmetric(vertical: Dimens.dimen5),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextTitle(String text) {
    return Text(
      text,
      style: textStyle18Medium,
    );
  }

  Widget _buildStages() {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (_, index) {
          return Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colorLightGray2,
            ),
            child: Center(
              child: Text('$index'),
            ),
          );
        },
        separatorBuilder: (_, index) => hGap10,
      ),
    );
  }
}
