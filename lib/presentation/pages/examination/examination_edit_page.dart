import 'package:covid_overcoming/core/base/base_state_mixin.dart';
import 'package:covid_overcoming/presentation/widgets/common_app_bar.dart';
import 'package:covid_overcoming/presentation/widgets/common_buttons.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_form_field.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class ExaminationEditPage extends StatefulWidget {
  const ExaminationEditPage({Key? key}) : super(key: key);

  @override
  State<ExaminationEditPage> createState() => _ExaminationEditPageState();
}

class _ExaminationEditPageState extends State<ExaminationEditPage>
    with BaseStateMixin<ExaminationEditPage> {
  final List<TextEditingController> _conditionControllers = [];
  final _conclusionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    addNewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPage(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return CommonAppBar(
      title: 'Rule editor',
      titleTextStyle: textStyle18Medium.copyWith(height: 1.3),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.save_alt_rounded),
          color: colorPrimary,
        ),
      ],
    );
  }

  Widget _buildPage() {
    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.dimen15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildTextHeader('IF'),
                  vGap15,
                  _buildListTextFieldConditions(),
                  vGap15,
                  _buildTextHeader('THEN'),
                  vGap15,
                  _buildSingleTextField(
                    _conclusionController,
                    hintText: 'Enter conclusion',
                  ),
                ],
              ),
            ),
          ),
        ),
        _buildButtonAddPremise(),
      ],
    );
  }

  Widget _buildTextHeader(String text) {
    return Text(
      text,
      style: textStyle20Medium,
    );
  }

  Widget _buildListTextFieldConditions() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _conditionControllers.length,
      itemBuilder: (_, index) {
        return _buildSingleTextField(_conditionControllers[index]);
      },
      separatorBuilder: (_, __) => vGap15,
    );
  }

  Widget _buildSingleTextField(
    TextEditingController controller, {
    String? hintText,
  }) {
    return CommonTextFormField(
      hintText: hintText ?? 'Enter condition',
      onChanged: (text) {
        // Don't need this
      },
      controller: controller,
    );
  }

  Widget _buildButtonAddPremise() {
    return Container(
      padding: const EdgeInsets.all(Dimens.dimen15),
      decoration: const BoxDecoration(
        color: colorWhite,
        boxShadow: [
          BoxShadow(
            color: colorGray200,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: CommonElevatedButton(
        text: 'Add new condition',
        radius: Dimens.radius30,
        onPressed: () {
          setState(() {
            addNewController();
          });
        },
      ),
    );
  }

  void addNewController() {
    _conditionControllers.add(TextEditingController());
  }
}
