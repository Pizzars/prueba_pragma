import 'package:flutter/material.dart';

class ColorsApp {
  static const Color primary = Color.fromRGBO(118, 32, 207, 1);
  static const Color primary300 = Color.fromRGBO(191, 188, 252, 1);
  static const Color secondary = Color.fromRGBO(255, 255, 255, 1);
  static const Color tertiary = Color.fromRGBO(29, 29, 27, 1);

  static const Color textColor = Color.fromRGBO(29, 29, 27, 1);

}

class PaddingApp {
  static const screen = EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 32);
  static const container = EdgeInsets.symmetric(horizontal: 15, vertical: 20);
  static const widget = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
  static const zero = EdgeInsets.all(0);
}

class BorderRadiusApp {
  static BorderRadius widget = BorderRadius.circular(10);
}