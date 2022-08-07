import 'package:covid_overcoming/values/res/fonts.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightThemeData(BuildContext context) {
  return ThemeData(
    fontFamily: Fonts.poppins,
    primaryColor: colorPrimary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: colorContentLightTheme),
    colorScheme: const ColorScheme.light(
      primary: colorPrimary,
      secondary: colorSecondary,
      error: colorError,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: colorContentLightTheme.withOpacity(0.7),
      unselectedItemColor: colorContentLightTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: colorPrimary),
      showUnselectedLabels: true,
    ),
  );
}

ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: colorPrimary,
    scaffoldBackgroundColor: colorContentLightTheme,
    appBarTheme: appBarTheme,
    iconTheme: const IconThemeData(color: colorContentDarkTheme),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: colorPrimary,
      secondary: colorSecondary,
      error: colorError,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorContentLightTheme,
      selectedItemColor: Colors.white70,
      unselectedItemColor: colorContentDarkTheme.withOpacity(0.32),
      selectedIconTheme: const IconThemeData(color: colorPrimary),
      showUnselectedLabels: true,
    ),
  );
}

const appBarTheme = AppBarTheme(centerTitle: false, elevation: 0);

extension BuildContextExt on BuildContext {
  TextStyle get headline1 =>
      Theme.of(this).textTheme.headline1?.copyWith(
            fontSize: 62,
            color: Colors.black,
          ) ??
      const TextStyle();

  TextStyle get headline2 =>
      Theme.of(this).textTheme.headline2 ?? const TextStyle();

  TextStyle get headline3 =>
      Theme.of(this).textTheme.headline3 ?? const TextStyle();

  TextStyle get headline4 =>
      Theme.of(this).textTheme.headline4 ?? const TextStyle();

  TextStyle get headline5 =>
      Theme.of(this).textTheme.headline5 ?? const TextStyle();

  TextStyle get headline6 =>
      Theme.of(this).textTheme.headline6 ?? const TextStyle();

  TextStyle get button => Theme.of(this).textTheme.button ?? const TextStyle();

  TextStyle get subtitle1 =>
      Theme.of(this).textTheme.subtitle1 ?? const TextStyle();

  TextStyle get subtitle2 =>
      Theme.of(this).textTheme.subtitle2 ?? const TextStyle();

  TextStyle get overline =>
      Theme.of(this).textTheme.overline ?? const TextStyle();

  TextStyle get bodyText1 =>
      Theme.of(this).textTheme.bodyText1 ?? const TextStyle();
}
