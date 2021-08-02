part of auth;

@immutable
abstract class AuthenticationEvent {}

class AppLoadedWithAuth extends AuthenticationEvent {}

class AppLoadedWithOutAuth extends AuthenticationEvent {}

class AppLoginSuccessEvent extends AuthenticationEvent {
  final String accessToken;
  final String? refreshToken;

  AppLoginSuccessEvent(this.accessToken, [this.refreshToken]);
}

class AppLoginEvent extends AuthenticationEvent {
  AppLoginEvent();
}

class AppLogoutEvent extends AuthenticationEvent {
  final String? message;

  AppLogoutEvent({this.message});
}
