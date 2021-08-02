part of auth;

mixin AuthServiceMixin on AuthService {
  SharedPreferences? sharedPreferences;

  @override
  String? getRefreshToken() {
    if (_refreshToken == null)
      _refreshToken = sharedPreferences?.getString(AuthService.keyRefreshToken);
    return _refreshToken;
  }

  @override
  removeRefreshToken() {
    _refreshToken = null;
    sharedPreferences?.remove(AuthService.keyRefreshToken);
  }

  @override
  setRefreshToken(String? refreshToken) {
    this._refreshToken = refreshToken;
    if (_refreshToken != null)
      sharedPreferences?.setString(AuthService.keyRefreshToken, _refreshToken!);
  }

  @override
  String? getAccessToken() {
    if (_accessToken == null)
      _accessToken = sharedPreferences?.getString(AuthService.keyAccessToken);
    return _accessToken;
  }

  @override
  removeAccessToken() {
    _accessToken = null;
    sharedPreferences?.remove(AuthService.keyAccessToken);
  }

  @override
  setAccessToken(String accessToken) {
    this._accessToken = accessToken;
    sharedPreferences?.setString(AuthService.keyAccessToken, accessToken);
  }
}
