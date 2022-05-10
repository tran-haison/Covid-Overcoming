import 'package:covid_overcoming/presentation/pages/main/home/home_page.dart';
import 'package:covid_overcoming/presentation/pages/main/schedule/schedule_page.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  // TODO: change page
  List<Widget> pages = [
    const HomePage(),
    const Text(Strings.test, style: textStyle40ItalicBold),
    const SchedulePage(),
    const Text(Strings.profile, style: textStyle40ItalicBold),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: pages[_currentIndex],
    );
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: colorPrimary.withOpacity(0.5),
        backgroundColor: Colors.grey[100],
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: Dimens.fontSize12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      child: NavigationBar(
        height: 60,
        animationDuration: const Duration(seconds: 1),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        selectedIndex: _currentIndex,
        onDestinationSelected: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: Strings.home,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.eco),
            icon: Icon(Icons.eco_outlined),
            label: Strings.test,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.contactless),
            icon: Icon(Icons.contactless_outlined),
            label: Strings.schedule,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: Strings.profile,
          ),
        ],
      ),
    );
  }
}
