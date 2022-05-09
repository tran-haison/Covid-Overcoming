import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/widgets/common_gaps.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({Key? key}) : super(key: key);

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dimen20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                S.current.schedule,
                style: textStyle30Medium,
              ),
              vGap10,
              _buildTabBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: colorLightGray1,
        borderRadius: BorderRadius.circular(Dimens.radius8),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: colorWhite,
        unselectedLabelColor: colorPrimary,
        indicator: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(Dimens.radius8),
        ),
        tabs: [
          Tab(
            text: S.current.expert,
          ),
          Tab(
            text: S.current.appointment,
          )
        ],
      ),
    );
  }
}
