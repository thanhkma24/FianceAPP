// File network_manager
// @project example
// @author hoangminhk4b on 15-07-2021
import 'package:example/auth/AuthServiceImpl.dart';
import 'package:example/network/config.dart';
import 'package:network/interceptor/interceptor.dart';
import 'package:network/network.dart';

final apiProvider = APIClient.init(
    config: BuildConfig.dev(),
    headerAuthorized: HeaderAuthorized(
        accessToken: AuthServiceImpl().getAccessToken(),
        type: "Bearer",
        refreshToken: (dio) async {
          return Future.value("ok");
        }),
    msgErrorHandler: MsgErrorHandler(
        msgTimeOut: "time out",
        msgNetworkOther: "network fail",
        handlerDioErrorTypeResponse: (dioError) {
          final data = dioError.response?.data;
          return data == null
              ? dioError
              : dioError.copyWith(error: data["message"]);
        }),
    interceptors: []).get();
