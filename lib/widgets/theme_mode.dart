import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  splashColor: Colors.white,
  primaryColor: Colors.deepOrange,
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, foregroundColor: Colors.black),
  scaffoldBackgroundColor: Colors.grey[100],
  cardTheme: CardTheme(color: Colors.white),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  splashColor: Colors.black26,
  
  primaryColor: Colors.deepOrange,
  iconTheme: const IconThemeData(color: Colors.deepOrange),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepOrange, foregroundColor: Colors.white),
  scaffoldBackgroundColor: Colors.grey[800],
  cardTheme: CardTheme(color: Colors.black87),
);
