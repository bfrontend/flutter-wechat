import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

// utils
import './utils/shared_preferences.dart';
// routers
import './routers/routers.dart';
import './routers/application.dart';

import './home/home_screen.dart';
import './views/welcome_page/index.dart';
import './constants.dart' show AppColors;


SpUtil sp;

void main() async {
  sp = await SpUtil.getInstance();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  MyApp() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  showWelcomePage() {
    bool showWelcome = sp.getBool(SharedPreferencesKeys.showWelcome);
    if (showWelcome == null || showWelcome == true) {
      return WelcomePage();
    } else {
      return HomeScreen();
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '微信',
      theme: ThemeData.light().copyWith(
          primaryColor: Color(AppColors.AppBarColor),
          cardColor: Color(AppColors.AppBarColor)
      ),
      home: showWelcomePage(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
