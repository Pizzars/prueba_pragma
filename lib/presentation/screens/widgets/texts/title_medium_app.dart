import 'package:flutter/material.dart';

import '../../../../config/helpers/styles_app.dart';

class TitleMedium extends StatelessWidget {

  final String text;
  final Color? color;
  const TitleMedium({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? ColorsApp.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}
