// File material_stub_mixin
// @project example
// @author hoangminhk4b on 17-07-2021

import 'package:common/core/app/material_app.dart';
import 'package:flutter/material.dart';

mixin MaterialAppMixin<T extends StatefulWidget> on State<T>
    implements AppConfig, IOAppConfig {

  @override
  Widget? get home => throw UnimplementedError();

  @override
  LocaleResolutionCallback? get localeResolutionCallback => throw UnimplementedError();

  @override
  Iterable<LocalizationsDelegate>? get localizationsDelegates => throw UnimplementedError();

  @override
  Widget? get login => throw UnimplementedError();

  @override
  Widget? get main => throw UnimplementedError();

  @override
  GlobalKey<NavigatorState> get navigationKey => throw UnimplementedError();

  @override
  openLogin(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  bool get requiredAuth => throw UnimplementedError();

  @override
  Locale? locale;

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Iterable<Locale> get supportedLocales => throw UnimplementedError();

}
