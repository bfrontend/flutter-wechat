import 'package:fluro/fluro.dart';

import './router_handler.dart';

class Routes {
  static String root = '/';
  static String home = '/home';

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
  }
}