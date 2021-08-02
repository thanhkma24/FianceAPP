import 'package:common/utils/color.dart';
import 'package:example/ui/signup/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

class TermsPrivacyScreen extends StatefulWidget {
  static String routeName = 'TermsPrivacyScreen';

  @override
  _TermsPrivacyState createState() => _TermsPrivacyState();
}

class _TermsPrivacyState extends State<TermsPrivacyScreen> {
  final List<String> _fakeListTC = List.filled(10, '');
  bool _isAcceptTC = false;

  void notifyChange() => setState(() {});

  void _onPressedNext() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => SignupScreen(),
      ),
    );
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
                  padding: EdgeInsets.symmetric(
                    vertical: 32,
                    horizontal: 44,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
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
                              text: _translate.terms,
                              style: TextStyle(
                                color: _theme.primaryColor,
                              ),
                            ),
                            TextSpan(
                              text: _translate.application,
                              style: TextStyle(
                                color: _theme.accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Expanded(
                        child: NotificationListener<
                            OverscrollIndicatorNotification>(
                          onNotification: (overscroll) {
                            overscroll.disallowGlow();
                            return true;
                          },
                          child: ListView.builder(
                            itemCount: _fakeListTC.length,
                            itemBuilder: (ctx, i) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus ligula erat, aliquam ut ligula vitae, interdum convallis eros. Nunc a diam et neque auctortincidunt. Aliquam sit amet nunc consectetur, viverra lorem vel, tincidunt mauris. Nunc iaculis ligula ac massa fringilla, et suscipit augue laoreet. Nam idvehicula magna. Etiam faucibus sagittis dui eu aliquam. Etiam pulvinar vestibulum condimentum. Duis in metus placerat, blandit nisl et, consequat diam.',
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ColorUtils.hexToColor('#707070'),
                                  ),
                                ),
                                SizedBox(
                                  height: i == _fakeListTC.length - 1 ? 0 : 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 68,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              _isAcceptTC = !_isAcceptTC;
                              notifyChange();
                            },
                            child: SizedBox(
                              height: 40,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Container(
                                    width: 15,
                                    height: 15,
                                    margin: EdgeInsets.only(
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: _theme.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    child: Center(
                                      child: _isAcceptTC
                                          ? Icon(
                                              Icons.check,
                                              size: 12,
                                              color: _theme.primaryColor,
                                            )
                                          : null,
                                    ),
                                  ),
                                  Text(
                                    _translate.acceptTC,
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: _theme.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 130,
                            child: TextButton(
                              onPressed: _isAcceptTC ? _onPressedNext : null,
                              child: Text(
                                _translate.tcontinue,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: _theme.primaryColor
                                    .withOpacity(_isAcceptTC ? 1 : 0.7),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
