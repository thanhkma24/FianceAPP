// File material_web_mixin
// @project example
// @author hoangminhk4b on 17-07-2021

import 'package:common/common.dart';
import 'package:flutter/material.dart';

mixin MaterialAppMixin<T extends StatefulWidget> on State<T>
    implements IOAppConfig, AppConfig {
  @override
  Widget? get home => BlocConsumer<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          assert(main != null);
          assert(login != null);
          if (requiredAuth &&
              state.status != AuthenticationStatus.authenticated) return login!;
          return main!;
        },
        listener: (context, state) {
          if (state.status == AuthenticationStatus.openLogin)
            openLogin(context);
        },
        buildWhen: (preState, currentState) {
          return requiredAuth &&
              currentState.status != AuthenticationStatus.openLogin;
        },
        listenWhen: (preState, currentState) {
          if (!requiredAuth &&
              currentState.status == AuthenticationStatus.openLogin)
            return true;
          return false;
        },
      );

  @override
  GlobalKey<NavigatorState> get navigationKey => NavigatorManager.navRoot;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigationKey,
      onGenerateTitle: (context) => title,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      home: home,
    );
  }
}
