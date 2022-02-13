import 'package:flutter/material.dart';
import 'package:quiddy/src/constants/strings.dart';
import 'package:quiddy/src/ui/dashboard/dashboard_screen.dart';
import 'package:quiddy/src/ui/graphic/graphic_screen.dart';
import 'package:quiddy/src/ui/login/login_screen.dart';
import 'package:quiddy/src/ui/register/register_screen.dart';

class Routes {
  Routes._();

  static final routes = <String, WidgetBuilder>{
    // register
    Strings.register: (BuildContext context) => RegisterScreen(),
    // login
    Strings.login: (BuildContext context) => LoginScreen(),
    // dashboard
    Strings.dashboard: (BuildContext context) => DashboardScreen(),
    //graphic
    Strings.graphic: (BuildContext context) => GraphicScreen(),
  };
}
