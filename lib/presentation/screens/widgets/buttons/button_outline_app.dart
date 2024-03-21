import 'package:flutter/material.dart';
import 'package:prueba_inlaze/presentation/screens/widgets/texts/title_small_app.dart';

import '../../../../config/helpers/styles_app.dart';

class ButtonOutlineApp extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  const ButtonOutlineApp({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorsApp.primary),
          borderRadius: BorderRadiusApp.widget,
        ),
        width: double.infinity,
        alignment: Alignment.center,
        padding: PaddingApp.widget,
        child: TitleSmall(text: text, color: ColorsApp.primary,),
      ),
    );
  }
}
