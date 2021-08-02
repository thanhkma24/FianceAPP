import 'package:example/components/input_login.dart';
import 'package:example/ui/forgot_password/forgot_enter_password.dart';
import 'package:flutter/material.dart';
import 'package:localizations/generated/l10n.dart';

class ForgotEnterPhoneScreen extends StatefulWidget {
  static String routeName = 'ForgotEnterPhoneScreen';

  @override
  _ForgotEnterPhoneScreenState createState() => _ForgotEnterPhoneScreenState();
}

class _ForgotEnterPhoneScreenState extends State<ForgotEnterPhoneScreen> {
  final phoneController = TextEditingController();

  bool checkFilledForm() {
    return phoneController.text.isEmpty;
  }

  void notifyChange() => setState(() => {});

  void _onPressedBack() {
    Navigator.of(context).pop();
  }

  void _onPressedNext() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ForgotEnterPasswordScreen(),
      ),
    );
  }

  @override
  void initState() {
    phoneController.addListener(notifyChange);
    super.initState();
  }

  @override
  void dispose() {
    phoneController.removeListener(notifyChange);
    phoneController.dispose();
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
                              controller: phoneController,
                              labelText: _translate.phone,
                              hintText: _translate.enter_phone,
                              prefixIcon: Icon(
                                Icons.call,
                                color: _theme.primaryColor,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              _translate.enter_phone_correctly,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _theme.hintColor.withOpacity(1),
                              ),
                            ),
                            SizedBox(
                              height: 156,
                            ),
                            TextButton(
                              onPressed:
                                  checkFilledForm() ? null : _onPressedNext,
                              child: Text(
                                _translate.tcontinue,
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
