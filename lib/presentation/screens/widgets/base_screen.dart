import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../config/helpers/responsive.dart';
import '../../../config/helpers/styles_app.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool gradient;
  const BaseScreen({super.key, required this.child, this.gradient = true});

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive(context);

    return Container(
      width: responsive.screenWidth(),
      height: responsive.screenHeight(),
      decoration: BoxDecoration(
        // Box decoration takes a gradient
        color: gradient ? null :ColorsApp.tertiary,
        gradient: !gradient ? null : const LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          colors: <Color>[
            // Colors are easy thanks to Flutter's Colors class.
            ColorsApp.tertiary,
            ColorsApp.secondary,
          ],
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        // child: Container(
        child: Padding(
          padding: PaddingApp.screen,
          // decoration: BoxDecoration(
          //   // color: Colors.white.withOpacity(0.3),
          // ),
          child: child,
        ),
      ),
    );
  }
}
