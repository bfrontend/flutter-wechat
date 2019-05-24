import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

Handler homeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomeScreen();
  }
);