import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../config/helpers/responsive.dart';
import '../../../config/helpers/styles_app.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool gradient;
  final bool rounded;
  const BaseScreen({super.key, required this.child, this.gradient = false, this.rounded = false});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.primary300,
        borderRadius: !rounded ? null : const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
        child: Container(
          width: responsive.screenWidth(),
          height: responsive.screenHeight(),
          decoration: BoxDecoration(
            // Box decoration takes a gradient
            // color: gradient ? null :ColorsApp.primary300,
            gradient: gradient ? null : LinearGradient(
              // Where the linear gradient begins and ends
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // Add one stop for each color. Stops should increase from 0 to 1
              colors: <Color>[
                // Colors are easy thanks to Flutter's Colors class.
                ColorsApp.secondary.withOpacity(0.4),
                ColorsApp.secondary.withOpacity(0.9),
              ],
            ),
          ),
          child: Padding(
            padding: PaddingApp.screen,
            // decoration: BoxDecoration(
            //   // color: Colors.white.withOpacity(0.3),
            // ),
            child: child,
          ),
        ),
      ),
    );
  }
}
