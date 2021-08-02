import 'package:example/components/input_login.dart';
import 'package:flutter/material.dart';
import 'package:localizations/generated/l10n.dart';

class ForgotEnterPasswordScreen extends StatefulWidget {
  static String routeName = 'ForgotEnterPasswordScreen';

  @override
  _ForgotEnterPasswordScreenState createState() =>
      _ForgotEnterPasswordScreenState();
}

class _ForgotEnterPasswordScreenState extends State<ForgotEnterPasswordScreen> {
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  bool checkFilledForm() {
    return passwordController.text.isEmpty ||
        passwordController.text != confirmController.text;
  }

  void notifyChange() => setState(() => {});

  void _onPressedBack() {
    Navigator.of(context).pop();
  }

  void _onPressedConfirm() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  @override
  void initState() {
    passwordController.addListener(notifyChange);
    confirmController.addListener(notifyChange);
    super.initState();
  }

  @override
  void dispose() {
    passwordController.removeListener(notifyChange);
    confirmController.removeListener(notifyChange);
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final _theme = Theme.of(context);
    final _translate = Translate.of(context);

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
                flex: 4,
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
                          horizontal: 32,
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 36,
                                  height: 36,
                                  child: TextButton(
                                    onPressed: _onPressedBack,
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: _theme.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(36),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  _translate.forgotPassword,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: _theme.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 36,
                                  height: 36,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InputLogin(
                              fieldPassword: true,
                              controller: passwordController,
                              labelText: _translate.new_password,
                              hintText: _translate.enter_new_password,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            InputLogin(
                              fieldPassword: true,
                              controller: confirmController,
                              labelText: _translate.confirm_new_password,
                              hintText: _translate.enter_confirm_password,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 110,
                            ),
                            TextButton(
                              onPressed:
                                  checkFilledForm() ? null : _onPressedConfirm,
                              child: Text(
                                _translate.accept,
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
