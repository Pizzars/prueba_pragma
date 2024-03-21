import 'package:flutter/material.dart';

class SpaceApp extends StatelessWidget {
  final int space;
  final bool horizontal;
  const SpaceApp ({super.key, this.space = 1, this.horizontal = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: horizontal ? space * 10 : 0,
      height: !horizontal ? space * 10 : 0,
    );
  }
}
