import 'package:flutter/material.dart';

import '../../../../config/helpers/styles_app.dart';

class TitleSmall extends StatelessWidget {

  final String text;
  final Color? color;
  final bool overflow;
  const TitleSmall({super.key, required this.text, this.color, this.overflow = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: overflow ? 2 : null,
      overflow: overflow ? TextOverflow.ellipsis : null,
      style: TextStyle(
        color: color ?? ColorsApp.textColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
