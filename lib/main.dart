import 'package:covid_overcoming/config/route/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

import 'app.dart';
import 'config/di/app_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init di
  await configureDependencies();

  // Init routes
  configureRoutes();

  // Init instances
  await configureInstances();

  runApp(const App());
}

Future<void> configureInstances() async {
  SpUtil.getInstance();
  await Firebase.initializeApp();
}
