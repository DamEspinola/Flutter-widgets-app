import 'package:flutter/material.dart';

const colorsList = <Color>[
  Colors.amberAccent,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Colors.cyan,
  Colors.deepOrangeAccent,
  Colors.deepPurple,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme( {
    this.selectedColor = 0,
    this.isDarkMode = false
    })
      : assert(selectedColor >= 0, "Selected color must be greater then 0"),
        assert(selectedColor < colorsList.length,
            "Selected color must be less or equal than ${colorsList.length - 1 }");

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorsList[selectedColor],
          brightness: isDarkMode ? Brightness.dark : Brightness.light, 
        appBarTheme: AppBarTheme(
          centerTitle: false
        )
      );
}
