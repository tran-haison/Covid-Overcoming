import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dimen10,
          horizontal: Dimens.dimen15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTextGreeting(),
            _buildTextDate(),
            vGap10,
            _buildTextTitle('Stages'),
            vGap10,
            _buildStages(),
            vGap10,
          ],
        ),
      ),
    );
  }

  Widget _buildTextGreeting() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Good afternoon',
        style: TextStyle(
          fontSize: Dimens.fontSize22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTextDate() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Wednesday, April 27th 2022',
        style: TextStyle(
          color: colorTextGray,
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
