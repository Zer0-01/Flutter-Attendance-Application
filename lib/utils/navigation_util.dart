import 'package:flutter/material.dart';

class NavigationUtil {
  static void pushNamed (BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }
}