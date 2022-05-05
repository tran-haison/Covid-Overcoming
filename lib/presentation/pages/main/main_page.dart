import 'package:covid_overcoming/presentation/pages/main/home/home_page.dart';
import 'package:covid_overcoming/presentation/widgets/common_text_styles.dart';
import 'package:covid_overcoming/values/res/colors.dart';
import 'package:covid_overcoming/values/res/dimens.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    const Text(Strings.exercise, style: textStyle40ItalicBold),
    const Text(Strings.profile, style: textStyle40ItalicBold),
  ];

  List<String> titles = [
    Strings.home,
    Strings.test,
    Strings.exercise,
    Strings.profile,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorWhite,
      appBar: _buildAppbar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppbar() {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      elevation: Dimens.elevation0_5,
      backgroundColor: colorWhite,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: colorLightGray2,
      ),
      title: Text(titles[_currentIndex]),
      titleTextStyle: const TextStyle(
        fontSize: Dimens.fontSize22,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.italic,
        color: colorLightBlack,
        letterSpacing: 1.2,
      ),
      actions: <Widget>[
        IconButton(
          color: colorLightBlack,
          onPressed: () {
            // TODO: open settings
          },
          icon: const Icon(Icons.settings),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return pages[_currentIndex];
  }

  Widget _buildBottomNavigationBar() {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: colorPrimary.withOpacity(0.4),
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
            selectedIcon: Icon(Icons.analytics),
            icon: Icon(Icons.analytics_outlined),
            label: Strings.exercise,
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
