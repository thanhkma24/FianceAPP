// File config
// @project example
// @author hoangminhk4b on 15-07-2021

import 'package:network/network.dart';

class BuildConfig with ConfigMixin implements Config {
  BuildConfig._({
    this.connectTimeout,
    this.receiveTimeout,
    this.socketUrl,
    required this.baseUrl,
  });

  BuildConfig.dev() : this._(baseUrl: "https://../");

  BuildConfig.release() : this._(baseUrl: "https://../");

  @override
  int? connectTimeout;

  @override
  int? receiveTimeout;

  @override
  String? socketUrl;

  @override
  String? baseUrl;

}
