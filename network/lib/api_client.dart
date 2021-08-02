// File APIClient
// @project example
// @author hoangminhk4b on 13-07-2021
part of network;

class APIClient {
  late final Dio _dio;

  APIClient.init(
      {Config? config,
      HeaderAuthorized? headerAuthorized,
      MsgErrorHandler? msgErrorHandler,
      List<Interceptor>? interceptors}) {
    final dioConfig = config;
    _dio = Dio(dioConfig?.toOptions());
    setInterceptors(
        interceptors ?? List.empty(), headerAuthorized, msgErrorHandler);
  }

  setInterceptors(List<Interceptor> interceptors,
      HeaderAuthorized? headerAuthorized, MsgErrorHandler? msgErrorHandler) {
    //add log without mode release
    if (!kReleaseMode)
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    //add interceptor
    _dio.interceptors.addAll([
      HeaderInterceptor(headerAuthorized),
      AuthorizedInterceptor(_dio, headerAuthorized),
      ErrorHandleInterceptor(msgErrorHandler),
      ...interceptors
    ]);
  }

  Dio get() => _dio;
}
