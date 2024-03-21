import 'package:flutter/material.dart';
import 'package:prueba_inlaze/config/helpers/styles_app.dart';

class TitleApp extends StatelessWidget {

  final String text;
  final Color? color;
  const TitleApp({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? ColorsApp.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }
}
