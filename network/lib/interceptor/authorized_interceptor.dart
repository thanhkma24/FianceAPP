// File authorized_interceptor
// @project example
// @author hoangminhk4b on 13-07-2021

part of 'interceptor.dart';

typedef Future<String> RefreshToken(BaseOptions baseOptions);

class HeaderAuthorized {
  final String? accessToken;
  final String? type;
  final RefreshToken? refreshToken;

  HeaderAuthorized({this.accessToken, this.type, this.refreshToken});
}

class AuthorizedInterceptor extends InterceptorsWrapper {
  final Dio _dio;
  final HeaderAuthorized? headerAuthorized;

  AuthorizedInterceptor(this._dio, this.headerAuthorized);

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // Assume 401 stands for token expired
    if (err.response?.statusCode == HttpStatus.unauthorized &&
        headerAuthorized?.accessToken != null) {
      var options = err.response!.requestOptions;
      // If the token has been updated, repeat directly.
      final accessToken = headerAuthorized?.accessToken;
      final type = headerAuthorized?.type ?? "";
      if (accessToken != options.headers[HttpHeaders.authorizationHeader]) {
        options.headers[HttpHeaders.authorizationHeader] = type + accessToken!;
        //repeat
        _dio.fetch(options).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
        return;
      }
      // update token and repeat
      // Lock to block the incoming request until the token updated
      _dio.lock();
      _dio.interceptors.responseLock.lock();
      _dio.interceptors.errorLock.lock();
      headerAuthorized?.refreshToken?.call(_dio.options).then((value) {
        //update accessToken
        options.headers[HttpHeaders.authorizationHeader] = value;
      }).whenComplete(() {
        _dio.unlock();
        _dio.interceptors.responseLock.unlock();
        _dio.interceptors.errorLock.unlock();
      }).then((e) {
        //repeat
        _dio.fetch(options).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
      });
      return;
    }
    return handler.next(err);
  }
}
