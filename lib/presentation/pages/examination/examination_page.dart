import 'package:covid_overcoming/config/di/app_module.dart';
import 'package:covid_overcoming/config/route/router/examination_router.dart';
import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/data/model/examination/examination_answer_model.dart';
import 'package:covid_overcoming/data/model/examination/examination_question_model.dart';
import 'package:covid_overcoming/presentation/pages/examination/bloc/examination_bloc.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_actions/external/platform_check/platform_check.dart';

class ExaminationPage extends StatefulWidget {
  const ExaminationPage({Key? key}) : super(key: key);

  @override
  State<ExaminationPage> createState() => _ExaminationPageState();
}

class _ExaminationPageState extends State<ExaminationPage>
    with BaseStateMixin<ExaminationPage> {
  String _currentAnswerId = '';

  final _examinationBloc = getIt<ExaminationBloc>();

  @override
  void initState() {
    super.initState();
    _examinationBloc.add(ExaminationGetFirstQuestionEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExaminationBloc>(
      create: (_) => _examinationBloc,
      child: BlocListener<ExaminationBloc, ExaminationState>(
        listener: (context, state) {
          if (state is ExaminationShouldSubmitState) {
            ExaminationRouter.goExaminationResult(
              context,
              isAssessmentPassed: _examinationBloc.isAssessmentPassed,
            );
          }
        },
        child: Scaffold(
          appBar: CommonAppBar(
            title: 'COVID-19 Assessment',
            titleTextStyle: textStyle18Medium.copyWith(height: 1.5),
          ),
          body: _buildPage(),
        ),
      ),
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
                  //_buildProgressBar(),
                  //vGap40,
                  _buildQuestionSection(),
                ],
              ),
            ),
          ),
          vGap15,
          _buildButtonNext(),
          _buildBottomGap(),
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
    return BlocBuilder<ExaminationBloc, ExaminationState>(
      builder: (context, state) {
        if (state is ExaminationLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ExaminationGetQuestionSuccessState) {
          final question = state.question;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _buildQuestionText(question),
              vGap20,
              _buildListAnswers(question),
            ],
          );
        }

        return empty;
      },
    );
  }

  Widget _buildQuestionText(ExaminationQuestionModel questionModel) {
    return Text(
      questionModel.question,
      style: textStyle20Medium.copyWith(height: 1.3, letterSpacing: 1.2),
    );
  }

  Widget _buildListAnswers(ExaminationQuestionModel questionModel) {
    final answers = questionModel.answers;
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: answers!.length,
      itemBuilder: (_, index) {
        final answer = answers[index];
        return _buildSingleAnswer(answer);
      },
      separatorBuilder: (_, __) => vGap15,
    );
  }

  Widget _buildSingleAnswer(ExaminationAnswerModel answerModel) {
    return Container(
      decoration: BoxDecoration(
        color: colorGray100,
        borderRadius: BorderRadius.circular(Dimens.radius10),
      ),
      padding: const EdgeInsets.symmetric(vertical: Dimens.dimen10),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: RadioListTile<String>(
          activeColor: colorPrimary,
          title: Text(
            '${answerModel.literal}. ${answerModel.answer}',
            style: textStyle16Medium.copyWith(height: 1.3),
          ),
          value: answerModel.id,
          groupValue: _currentAnswerId,
          onChanged: (newValue) {
            setState(() {
              _currentAnswerId = newValue ?? '';
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
        if (_currentAnswerId.isEmpty) {
          return;
        }
        _examinationBloc.add(ExaminationGetNextQuestionEvent(_currentAnswerId));
        _currentAnswerId = '';
      },
    );
  }

  Widget _buildBottomGap() {
    if (PlatformCheck.isIOS) {
      return vGap15;
    }
    return empty;
  }
}
