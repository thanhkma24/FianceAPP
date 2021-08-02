import 'package:common/auth/auth.dart';
import 'package:common/common.dart';
import 'package:common/utils/color.dart';
import 'package:example/bloc/login/login_cubit.dart';
import 'package:example/components/input_login.dart';
import 'package:example/network/network_manager.dart';
import 'package:example/repository/login/user_repository.dart';
import 'package:example/ui/forgot_password/forgot_enter_phone.dart';
import 'package:example/ui/terms_privacy/terms_privacy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

class LoginScreen extends StatefulWidget {
  final AuthenticationStatus? openLogin;
  static String routeName = 'LoginScreen';

  const LoginScreen({Key? key, this.openLogin}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginCubit = LoginCubit(UserRepositoryImpl(apiProvider));

  bool checkFilledForm() {
    return usernameController.text.isEmpty || passwordController.text.isEmpty;
  }

  void _onPressedLogin() {
    return;
    // ignore: dead_code
    loginCubit
        .login(usernameController.text, passwordController.text)
        .then((value) {
      final accessToken = value["access_token"];
      final refreshToken = value["refresh_token"];
      context
          .read<AuthenticationBloc>()
          .add(AppLoginSuccessEvent(accessToken, refreshToken));
      if (widget.openLogin == AuthenticationStatus.openLogin)
        Navigator.of(context).pop();
    }).catchError((e) {
      Log.info("loginCubit", e.message);
    });
  }

  void _onPressedForgotPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ForgotEnterPhoneScreen(),
      ),
    );
  }

  void _onPressedRegister() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => TermsPrivacyScreen(),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final _theme = Theme.of(context);
    final _translate = Translate.of(context);
    final _textScaleFactor = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      body: BlocProvider<LoginCubit>(
        create: (ctx) => loginCubit,
        child: SafeArea(
          bottom: false,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _theme.backgroundColor,
              image: DecorationImage(
                image: AssetImage('assets/images/login_background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Text(
                        'iMoney',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: _theme.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child:
                        NotificationListener<OverscrollIndicatorNotification>(
                      onNotification: (overscroll) {
                        overscroll.disallowGlow();
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 50,
                            horizontal: 44,
                          ),
                          child: Column(
                            children: <Widget>[
                              RichText(
                                textScaleFactor: _textScaleFactor,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: _translate.login,
                                      style: TextStyle(
                                        color: _theme.primaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: _translate.toYourAccount,
                                      style: TextStyle(
                                        color: _theme.accentColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              InputLogin(
                                controller: usernameController,
                                labelText: _translate.username,
                                hintText: _translate.enterUsername,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: _theme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              InputLogin(
                                fieldPassword: true,
                                controller: passwordController,
                                labelText: _translate.password,
                                hintText: _translate.enterPassword,
                                prefixIcon: Icon(
                                  Icons.lock_outlined,
                                  color: _theme.primaryColor,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  RichText(
                                    textScaleFactor: _textScaleFactor,
                                    text: TextSpan(
                                      text: _translate.forgotPassword,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            _theme.primaryColor.withOpacity(.7),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = _onPressedForgotPassword,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              TextButton(
                                onPressed:
                                    checkFilledForm() ? null : _onPressedLogin,
                                child: Text(
                                  _translate.login,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                style: TextButton.styleFrom(
                                  fixedSize: Size.fromWidth(250),
                                  primary: Colors.white,
                                  backgroundColor: _theme.primaryColor
                                      .withOpacity(checkFilledForm() ? 0.7 : 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                _translate.or.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: _theme.primaryColor.withOpacity(.7),
                                ),
                              ),
                              SizedBox(
                                height: 24,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                        'assets/images/icon_facebook.png'),
                                    SizedBox(width: 20),
                                    Text(
                                      _translate.facebook,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                style: TextButton.styleFrom(
                                  fixedSize: Size.fromHeight(40),
                                  primary: Colors.white,
                                  backgroundColor:
                                      ColorUtils.hexToColor('#4267B2')
                                          .withOpacity(.9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                        'assets/images/icon_google.png'),
                                    SizedBox(width: 16),
                                    Text(
                                      _translate.google,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                                style: TextButton.styleFrom(
                                  fixedSize: Size.fromHeight(40),
                                  primary: Colors.white,
                                  backgroundColor:
                                      ColorUtils.hexToColor('#DB4437')
                                          .withOpacity(.9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              RichText(
                                textScaleFactor: _textScaleFactor,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  children: <InlineSpan>[
                                    TextSpan(
                                      text: _translate.dontHaveAnAccount,
                                      style: TextStyle(
                                        color:
                                            _theme.accentColor.withOpacity(.7),
                                      ),
                                    ),
                                    TextSpan(
                                      text: _translate.signupNow,
                                      style: TextStyle(
                                        color:
                                            _theme.primaryColor.withOpacity(.7),
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = _onPressedRegister,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
