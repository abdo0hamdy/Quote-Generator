import 'package:flutter/material.dart';
import 'package:intern_task2/constans/strings.dart';
import 'package:intern_task2/screens/favorites_screen.dart';
import 'package:intern_task2/screens/qutoe_screen.dart';


class AppRoute {
  static Map<String, WidgetBuilder> routess = {
      Qutoe_screen : (context) => const QutoScreen(),
      favorite_screen : (context)=> const MyFavorites(),
    };
 
}
