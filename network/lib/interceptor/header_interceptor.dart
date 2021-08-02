// File header_interceptor
// @project example
// @author hoangminhk4b on 13-07-2021
part of 'interceptor.dart';

class HeaderInterceptor extends Interceptor {
  final HeaderAuthorized? headerAuthorized;

  HeaderInterceptor(this.headerAuthorized);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (headerAuthorized?.accessToken != null)
      options.headers[HttpHeaders.authorizationHeader] =
          headerAuthorized?.accessToken;
    options.contentType = Headers.jsonContentType;
    super.onRequest(options, handler);
  }
}
