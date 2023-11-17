import 'package:flutter/material.dart';
import 'package:invoice/provider/provider.dart';


class AppRoutes {
  static const String toDoListScreen = '/to_do_list_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    toDoListScreen: (context) => LockScreen(),
    // appNavigationScreen: (context) => AppNavigationScreen()
  };
}