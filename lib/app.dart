import 'package:covid_overcoming/config/route/routes.dart';
import 'package:covid_overcoming/generated/l10n.dart';
import 'package:covid_overcoming/presentation/pages/landing/welcome_page.dart';
import 'package:covid_overcoming/presentation/pages/main/main_page.dart';
import 'package:covid_overcoming/values/res/fonts.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: Strings.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: Fonts.poppins,
        ),
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        onGenerateRoute: router.generator,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const WelcomePage(),
      ),
    );
  }
}
