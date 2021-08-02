import 'package:common/auth/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthServiceImpl extends AuthService
    with AuthServiceMixin{
  static final AuthServiceImpl _singleton = AuthServiceImpl._();

  AuthServiceImpl._();

  factory AuthServiceImpl([SharedPreferences? shared]) {
    if (_singleton.sharedPreferences == null)
      _singleton.sharedPreferences = shared;
    return _singleton;
  }
}
