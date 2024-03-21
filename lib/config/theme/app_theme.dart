import 'package:flutter/material.dart';
import 'package:prueba_inlaze/config/helpers/styles_app.dart';


const seedColor = ColorsApp.primary;

class AppTheme {

  final bool isDarkmode;

  AppTheme({ required this.isDarkmode });

  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: seedColor,
    brightness: isDarkmode ? Brightness.dark : Brightness.light,

    listTileTheme: const ListTileThemeData(
      iconColor: seedColor,
      textColor: seedColor
    ),

  );

}