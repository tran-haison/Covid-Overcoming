// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Covid Overcoming`
  String get app_name {
    return Intl.message(
      'Covid Overcoming',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Page not found`
  String get page_not_found {
    return Intl.message(
      'Page not found',
      name: 'page_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Welcome,`
  String get welcome {
    return Intl.message(
      'Welcome,',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `We believe that everyone who used to be infected with Coronavirus and is suffering from post-Covid effects can recover and return to normal life, by listening to advices, tracking body stats and maintaining a healthy life`
  String get welcome_description {
    return Intl.message(
      'We believe that everyone who used to be infected with Coronavirus and is suffering from post-Covid effects can recover and return to normal life, by listening to advices, tracking body stats and maintaining a healthy life',
      name: 'welcome_description',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get features {
    return Intl.message(
      'Features',
      name: 'features',
      desc: '',
      args: [],
    );
  }

  /// `We continuously improve our product to bring more value to people`
  String get features_description {
    return Intl.message(
      'We continuously improve our product to bring more value to people',
      name: 'features_description',
      desc: '',
      args: [],
    );
  }

  /// `Recovery tracking`
  String get recovery_tracking {
    return Intl.message(
      'Recovery tracking',
      name: 'recovery_tracking',
      desc: '',
      args: [],
    );
  }

  /// `Monitor the stage of recovery to get full insight of heath status`
  String get recovery_tracking_description {
    return Intl.message(
      'Monitor the stage of recovery to get full insight of heath status',
      name: 'recovery_tracking_description',
      desc: '',
      args: [],
    );
  }

  /// `Exercise provider`
  String get exercise_provider {
    return Intl.message(
      'Exercise provider',
      name: 'exercise_provider',
      desc: '',
      args: [],
    );
  }

  /// `Provide exercises to help recover, from simple to advanced`
  String get exercise_provider_description {
    return Intl.message(
      'Provide exercises to help recover, from simple to advanced',
      name: 'exercise_provider_description',
      desc: '',
      args: [],
    );
  }

  /// `Test system`
  String get test_system {
    return Intl.message(
      'Test system',
      name: 'test_system',
      desc: '',
      args: [],
    );
  }

  /// `Various tests to quickly find out any problem with body system`
  String get test_system_description {
    return Intl.message(
      'Various tests to quickly find out any problem with body system',
      name: 'test_system_description',
      desc: '',
      args: [],
    );
  }

  /// `Expert connection`
  String get expert_connection {
    return Intl.message(
      'Expert connection',
      name: 'expert_connection',
      desc: '',
      args: [],
    );
  }

  /// `Talk to expert and follow advice for best recovery`
  String get expert_connection_description {
    return Intl.message(
      'Talk to expert and follow advice for best recovery',
      name: 'expert_connection_description',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? Sign up`
  String get dont_have_an_account_sign_up {
    return Intl.message(
      'Don\'t have an account? Sign up',
      name: 'dont_have_an_account_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in {
    return Intl.message(
      'Sign in',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message(
      'Sign up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Enter email and password to get started`
  String get enter_email_and_password_to_get_started {
    return Intl.message(
      'Enter email and password to get started',
      name: 'enter_email_and_password_to_get_started',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgot_password {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Begin your journey with us from today`
  String get begin_your_journey_with_us_from_today {
    return Intl.message(
      'Begin your journey with us from today',
      name: 'begin_your_journey_with_us_from_today',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? Sign in`
  String get already_have_an_account_sign_in {
    return Intl.message(
      'Already have an account? Sign in',
      name: 'already_have_an_account_sign_in',
      desc: '',
      args: [],
    );
  }

  /// `We will send a link to your email to reset password`
  String get we_will_send_a_link_to_your_email_to_reset_password {
    return Intl.message(
      'We will send a link to your email to reset password',
      name: 'we_will_send_a_link_to_your_email_to_reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
