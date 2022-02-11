import 'package:flutter/material.dart';
import 'package:quiddy/src/ui/account_info/account_info_screen.dart';

class Routes {
  Routes._();

  //static variables
  static const String accountInfo = '/accountinfo';

  static final routes = <String, WidgetBuilder>{
    accountInfo: (BuildContext context) => AccountInfoSecreen()
  };
}
