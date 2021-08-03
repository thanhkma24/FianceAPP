import 'package:common/common.dart';
import 'package:common/core/wrapper_application.dart';
import 'package:common/utils/color.dart';
import 'package:example/App.dart';
import 'package:example/auth/AuthServiceImpl.dart';
import 'package:example/data/services/database_handler.dart';
import 'package:example/ui/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:localizations/localizations.dart';

SharedPreferences? shared;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configure();
  shared = await SharedPreferences.getInstance();
  Translate.delegate.setShared(shared);
  await DatabaseHandler.instance.database
      .then((value) => print('create success'));
  Log.init();
  runApp(
    WrapperApplication(
      child: MyApp(),
      authService: AuthServiceImpl(shared),
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
    with MaterialAppMixin, LocalizationMixin {
  @override
  bool get requiredAuth => false;

  @override
  String get title => Translate.current.app_title;

  @override
  Widget get main => App();

  @override
  Widget? get login => LoginScreen();

  @override
  openLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LoginScreen(
          openLogin: AuthenticationStatus.openLogin,
        ),
      ),
    );
  }

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        primaryColor: ColorUtils.hexToColor('#FF7141'),
        accentColor: ColorUtils.hexToColor('#AAAAAA'),
        hintColor: ColorUtils.hexToColor('#9E9E9E').withOpacity(.3),
        backgroundColor: ColorUtils.hexToColor('#E0E1E9'),
      ),
    );
  }
}
