import 'package:flutter/material.dart';

import '../../../../config/helpers/styles_app.dart';

class TextApp extends StatelessWidget {

  final String text;
  final Color? color;
  const TextApp({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? ColorsApp.textColor,
        fontSize: 14,
      ),
    );
  }
}
