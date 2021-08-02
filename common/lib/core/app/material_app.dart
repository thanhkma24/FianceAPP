// File app
// @project example
// @author hoangminhk4b on 17-07-2021

import 'package:flutter/material.dart';

export 'stub/material_stub_mixin.dart'
// ignore: uri_does_not_exist
    if (dart.library.io) 'native/material_app_mixin.dart'
// ignore: uri_does_not_exist
    if (dart.library.html) 'web/material_web_mixin.dart';

abstract class IOAppConfig {
  Widget? get home;

  Widget? get login;

  Widget? get main;

  openLogin(BuildContext context);
}

abstract class AppConfig implements LocalizationAppConfig {
  String get title;

  bool get requiredAuth;

  GlobalKey<NavigatorState> get navigationKey;
}

/// Hiện flutter web chưa hoàn hiện -> route fail
abstract class WebAppConfig {
  RouteInformationParser<Object>? get routeInformationParser;

  RouterDelegate<Object>? get routerDelegate;
}

abstract class LocalizationAppConfig {
  Locale? locale;

  Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates;

  LocaleResolutionCallback? get localeResolutionCallback;

  Iterable<Locale> get supportedLocales;
}
