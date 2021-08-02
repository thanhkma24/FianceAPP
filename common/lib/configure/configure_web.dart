// File configure_web
// @project example
// @author hoangminhk4b on 17-07-2021

import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}