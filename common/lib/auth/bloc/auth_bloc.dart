part of auth;

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService;

  AuthenticationBloc(this.authService) : super(AuthenticationState.unknown());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppLoadedWithAuth) {
      var accessToken = authService.getAccessToken();
      if (accessToken != null)
        yield AuthenticationState.authenticated();
      else
        yield AuthenticationState.unauthenticated();
    }
    if (event is AppLoginSuccessEvent) {
      authService.setAccessToken(event.accessToken);
      authService.setRefreshToken(event.refreshToken);
      yield AuthenticationState.authenticated();
    }

    if (event is AppLoginEvent) {
      authService.removeAccessToken();
      yield AuthenticationState.openLogin();
      yield AuthenticationState.unauthenticated();
    }
    if (event is AppLogoutEvent) {
      authService.removeAccessToken();
      yield AuthenticationState.unauthenticated();
    }
  }
}
