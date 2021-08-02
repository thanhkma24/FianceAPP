library localizations;

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localizations/generated/l10n.dart';
import 'generated/AppLocale.dart' show AppLocale;

export 'package:localizations/generated/l10n.dart';
export 'generated/AppLocale.dart' show AppLocale;
export 'package:flutter_localizations/flutter_localizations.dart';

mixin LocalizationMixin<T extends StatefulWidget> on State<T> {
  Locale? locale;

  @protected
  Iterable<LocalizationsDelegate<dynamic>>? get localizationsDelegates => [
        Translate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  @protected
  LocaleResolutionCallback? get localeResolutionCallback => Translate.delegate
      .resolution(fallback: Locale.fromSubtags(languageCode: "vi"));

  @protected
  Iterable<Locale> get supportedLocales => Translate.delegate.supportedLocales;

  @mustCallSuper
  @override
  void initState() {
    locale = Translate.delegate
        .getLocaleCurrent(context, Locale.fromSubtags(languageCode: "vi"));
    AppLocale.onChangedLocale = (locale) {
      setState(() {
        this.locale = locale;
      });
    };
    super.initState();
  }

  @mustCallSuper
  @override
  void dispose() {
    AppLocale.onChangedLocale = null;
    super.dispose();
  }
}
