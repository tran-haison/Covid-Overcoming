import 'package:covid_overcoming/config/route/routes.dart';
import 'package:covid_overcoming/values/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        title: Strings.appName,
        debugShowCheckedModeBanner: false,
        showSemanticsDebugger: false,
        onGenerateRoute: router.generator,

        // TODO(): add more
      ),
    );
  }
}
