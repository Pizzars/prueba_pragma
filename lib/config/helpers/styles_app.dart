import 'package:flutter/material.dart';

class ColorsApp {
  static const Color primary = Color.fromRGBO(249, 217, 35, 1);
  static const Color secondary = Color.fromRGBO(30, 41, 59, 1);
  static const Color tertiary = Colors.black;

  static const Color textColor = Colors.white;

}

class PaddingApp {
  static const screen = EdgeInsets.symmetric(horizontal: 25, vertical: 30);
  static const container = EdgeInsets.symmetric(horizontal: 15, vertical: 20);
  static const widget = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
  static const zero = EdgeInsets.all(0);
}

class BorderRadiusApp {
  static BorderRadius widget = BorderRadius.circular(10);
}