import 'package:flutter/material.dart';

class ColorsApp {
  static const Color primary = Color.fromRGBO(0, 67, 145, 1);
  static const Color secondary = Color.fromRGBO(51, 178, 53, 1);
  static const Color tertiary = Colors.white;

  static const Color textColor = Colors.black;

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