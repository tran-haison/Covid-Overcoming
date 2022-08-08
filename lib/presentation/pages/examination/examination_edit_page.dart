import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class ExaminationEditPage extends StatefulWidget {
  const ExaminationEditPage({Key? key}) : super(key: key);

  @override
  State<ExaminationEditPage> createState() => _ExaminationEditPageState();
}

class _ExaminationEditPageState extends State<ExaminationEditPage>
    with BaseStateMixin<ExaminationEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: 'Rule editor'),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(Dimens.dimen15),
        child: Column(
          children: <Widget>[
            _buildTextSection('IF part'),
            vGap10,

          ],
        ),
      ),
    );
  }

  Widget _buildTextSection(String text) {
    return Text(
      text,
      style: textStyle18Medium,
    );
  }
}
