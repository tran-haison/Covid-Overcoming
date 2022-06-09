import 'package:covid_overcoming/config/route/router/profile_router.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/main/home/widgets/home_card_problem.dart';
import 'package:covid_overcoming/presentation/widgets/common_chips.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_images.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/constant/asset_paths.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with BaseStateMixin<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dimen20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context),
            vGap30,
            _buildCardCurrentStage(),
            vGap20,
            _buildCardProblems(),
            vGap30,
            _buildHealthStatus(),
            vGap30,
            _buildStages(),
            vGap20,
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                // TODO: implement greeting
                'Good afternoon,',
                style: textStyle14Gray,
              ),
              vGap5,
              Text(
                // TODO: get user name
                'Tran Hai Son',
                style: textStyle26Medium.copyWith(height: 1),
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            ProfileRouter.goProfile(context);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const CommonAssetImage(
            imagePath: AssetPaths.imgHacker,
            height: Dimens.dimen40,
            width: Dimens.dimen40,
          ),
        ),
      ],
    );
  }

  Widget _buildCardCurrentStage() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.radius10),
        color: colorGray100,
      ),
      child: InkWell(
        onTap: () {
          // TODO: implement stage click
        },
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dimen15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CommonAssetImage(
                imagePath: AssetPaths.imgChakra,
                height: 40,
                width: 40,
              ),
              hGap15,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      // TODO: get stage
                      'STAGE 3',
                      style: textStyle16Bold,
                    ),
                    Text(
                      // TODO: get compliment
                      'Keep up the good work!',
                    ),
                  ],
                ),
              ),
              hGap15,
              const Icon(
                Icons.arrow_right_alt,
                color: colorBlack,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardProblems() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        HomeCardProblem(
          title: S.current.physical,
          content: S.current.physical_problems,
          iconPath: AssetPaths.imgPhysicalProblem,
          cardColor: colorPrimary,
          iconBackgroundColor: colorWhite,
          titleColor: colorWhite,
          contentColor: colorLightGray1,
          elevation: 3,
          onTap: () {
            // TODO: implement physical problem click
          },
        ),
        HomeCardProblem(
          title: S.current.mental,
          content: S.current.mental_problems,
          iconPath: AssetPaths.imgMentalProblem,
          cardColor: colorWhite,
          iconBackgroundColor: colorBlue1,
          titleColor: colorPrimary,
          contentColor: colorTextGray,
          elevation: 3,
          onTap: () {
            // TODO: implement mental problem click
          },
        ),
      ],
    );
  }

  Widget _buildHealthStatus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.current.how_do_you_feel_today,
          style: textStyle18Medium,
        ),
        vGap10,
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            CommonFilterChip(label: 'Normal'),
            hGap10,
            CommonFilterChip(label: 'Headache'),
          ],
        ),
      ],
    );
  }

  Widget _buildStages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          S.current.stages,
          style: textStyle18Medium,
        ),
        vGap10,
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (_, index) {
              return Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.radius10),
                  color: colorLightGray1,
                ),
                child: Center(
                  child: Text('Stage $index'),
                ),
              );
            },
            separatorBuilder: (_, index) {
              return hGap10;
            },
          ),
        ),
      ],
    );
  }
}
