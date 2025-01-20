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

  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0, "Selected color must be greater then 0"),
        assert(selectedColor < colorsList.length,
            "Selected color must be less or equal than ${colorsList.length }");

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorsList[selectedColor],
        appBarTheme: AppBarTheme(
          centerTitle: false
        )
      );
}
