import 'package:example/components/input_login.dart';
import 'package:example/ui/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = 'SignupScreen';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<SignupScreen> {
  final usernameControler = TextEditingController();
  final fullnameControler = TextEditingController();
  final emailControler = TextEditingController();
  final phoneControler = TextEditingController();
  final passwordControler = TextEditingController();
  final confirmdControler = TextEditingController();

  bool _checkFilledForm() {
    return usernameControler.text.isEmpty ||
        fullnameControler.text.isEmpty ||
        emailControler.text.isEmpty ||
        phoneControler.text.isEmpty ||
        passwordControler.text.isEmpty ||
        passwordControler.text != confirmdControler.text;
  }

  void _onPressedSignup() {}

  void _onPressedLogin() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void dispose() {
    usernameControler.dispose();
    fullnameControler.dispose();
    emailControler.dispose();
    phoneControler.dispose();
    passwordControler.dispose();
    confirmdControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final _theme = Theme.of(context);
    final _translate = Translate.of(context);
    final _textScaleFactor = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      body: SafeArea(
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
                child: Container(),
              ),
              Expanded(
                flex: 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: NotificationListener<OverscrollIndicatorNotification>(
                    onNotification: (overscroll) {
                      overscroll.disallowGlow();
                      return true;
                    },
                    child: SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 32,
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
                                    text: _translate.signup,
                                    style: TextStyle(
                                      color: _theme.primaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: _translate.new_account,
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
                              controller: usernameControler,
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
                              controller: fullnameControler,
                              labelText: _translate.fullname,
                              hintText: _translate.enter_fullname,
                              prefixIcon: Icon(
                                Icons.edit,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            InputLogin(
                              controller: emailControler,
                              labelText: _translate.email,
                              hintText: _translate.enter_email,
                              prefixIcon: Icon(
                                Icons.email,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            InputLogin(
                              controller: phoneControler,
                              labelText: _translate.phone,
                              hintText: _translate.enter_phone,
                              prefixIcon: Icon(
                                Icons.call,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            InputLogin(
                              fieldPassword: true,
                              controller: passwordControler,
                              labelText: _translate.password,
                              hintText: _translate.enterPassword,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            InputLogin(
                              fieldPassword: true,
                              controller: confirmdControler,
                              labelText: _translate.confirm_password,
                              hintText: _translate.enter_confirm_password,
                              prefixIcon: Icon(
                                Icons.lock_outlined,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            TextButton(
                              onPressed:
                                  _checkFilledForm() ? null : _onPressedSignup,
                              child: Text(
                                _translate.signup,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                fixedSize: Size.fromWidth(250),
                                primary: Colors.white,
                                backgroundColor: _theme.primaryColor
                                    .withOpacity(_checkFilledForm() ? 0.7 : 1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
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
                                    text: _translate.have_an_account,
                                    style: TextStyle(
                                      color: _theme.accentColor.withOpacity(.7),
                                    ),
                                  ),
                                  TextSpan(
                                    text: _translate.login_now,
                                    style: TextStyle(
                                      color:
                                          _theme.primaryColor.withOpacity(.7),
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = _onPressedLogin,
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
    );
  }
}
