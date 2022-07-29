import 'package:covid_overcoming/config/route/router/examination_router.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class ExaminationPage extends StatefulWidget {
  const ExaminationPage({Key? key}) : super(key: key);

  @override
  State<ExaminationPage> createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage> {
  String _currentAnswer = 'A';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'COVID-19 Assessment',
        titleTextStyle: textStyle18Medium.copyWith(height: 1.5),
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.dimen15),
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _buildProgressBar(),
                  vGap40,
                  _buildQuestionSection(),
                ],
              ),
            ),
          ),
          vGap15,
          _buildButtonNext(),
        ],
      ),
    );
  }

  Widget _buildProgressBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          'Question: 05/15',
          style: textStyle18Medium,
        ),
        vGap10,
        LinearProgressIndicator(
          backgroundColor: colorGray100,
          value: 0.3,
        ),
      ],
    );
  }

  Widget _buildQuestionSection() {
    return Column(
      children: <Widget>[
        _buildQuestionText('Are you infected with COVID-19?'),
        vGap20,
        _buildListAnswers(),
      ],
    );
  }

  Widget _buildQuestionText(String question) {
    return Text(
      question,
      style: textStyle20Medium.copyWith(height: 1.3, letterSpacing: 1.2),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildListAnswers() {
    final answers = ['A. Yes I am', 'B. No I am totally negative'];
    final listAnswers = answers
        .map(
          (answer) => _buildSingleAnswer(answer),
        )
        .toList();
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listAnswers.length,
      itemBuilder: (_, index) {
        return listAnswers[index];
      },
      separatorBuilder: (_, __) => vGap15,
    );
  }

  Widget _buildSingleAnswer(String answer) {
    return Container(
      decoration: BoxDecoration(
        color: colorGray100,
        borderRadius: BorderRadius.circular(Dimens.radius30),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: RadioListTile<String>(
          activeColor: colorPrimary,
          title: Text(
            answer,
            style: textStyle16Medium.copyWith(height: 1.3),
          ),
          value: answer,
          groupValue: _currentAnswer,
          onChanged: (newValue) {
            setState(() {
              _currentAnswer = newValue ?? '';
            });
          },
        ),
      ),
    );
  }

  Widget _buildButtonNext() {
    return CommonElevatedButton(
      text: 'Next',
      radius: Dimens.radius30,
      onPressed: () {
        ExaminationRouter.goExaminationResult(context);
      },
    );
  }
}
