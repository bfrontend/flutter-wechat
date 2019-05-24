import 'package:flutter/material.dart';

import '../../utils/shared_preferences.dart';

class WelcomePage extends StatelessWidget {

  _goHomePage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue
      ),
      child: Center(
        child: FlatButton(
          child: Text(
            '去首页',
            style: TextStyle(
                color: Colors.white
            ),
          ),
          onPressed: () async {
            await SpUtil.getInstance()..putBool(SharedPreferencesKeys.showWelcome, false);
            _goHomePage(context);
          },
        ),
      ),
    );
  }
}
