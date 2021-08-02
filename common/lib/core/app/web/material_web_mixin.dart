// File material_web_mixin
// @project example
// @author hoangminhk4b on 17-07-2021

import 'package:common/common.dart';
import 'package:flutter/material.dart';

mixin MaterialAppMixin<T extends StatefulWidget> on State<T>
    implements AppConfig, IOAppConfig {
  @override
  GlobalKey<NavigatorState> get navigationKey => NavigatorManager.navRoot;

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
      if (state.status == AuthenticationStatus.openLogin) openLogin(context);
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
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigationKey,
      onGenerateTitle: (context) => title,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: supportedLocales,
      home: home,
    );
  }
///Config web
// @override
// Widget build(BuildContext context) {
//   return MaterialApp.router(
//     onGenerateTitle: (context) => title,
//     key: navigationKey,
//     routeInformationParser: routeInformationParser!,
//     routerDelegate: routerDelegate!,
//     locale: locale,
//     localeResolutionCallback: localeResolutionCallback,
//     localizationsDelegates: localizationsDelegates,
//     supportedLocales: supportedLocales,
//   );
// }

// @override
// RouteInformationParser<Object>? get routeInformationParser =>
//     throw UnimplementedError();
//
// @override
// RouterDelegate<Object>? get routerDelegate => throw UnimplementedError();
}
