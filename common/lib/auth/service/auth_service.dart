part of auth;

abstract class AuthService {
  static const String keyAccessToken = "accessToken";
  static const String keyRefreshToken = "refreshToken";

  String? _accessToken;
  String? _refreshToken;

  bool isLogin() {
    return _accessToken != null;
  }

  setRefreshToken(String? refreshToken);

  String? getRefreshToken();

  removeRefreshToken();

  setAccessToken(String accessToken);

  String? getAccessToken();

  removeAccessToken();
}
