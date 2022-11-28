import 'package:flutter/material.dart';

class DarkMood extends ChangeNotifier {
  ThemeData currentTheme;

  DarkMood({required bool isDarkMode})
      : currentTheme = isDarkMode
            ? ThemeData(
                useMaterial3: true, colorScheme: const ColorScheme.dark())
            : ThemeData(
                useMaterial3: true, colorScheme: const ColorScheme.light());
  setClaro() {
    currentTheme =
        ThemeData(useMaterial3: true, colorScheme: const ColorScheme.light());
    notifyListeners();
  }

  //
  setOscuro() {
    currentTheme =
        ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark());
    notifyListeners();
  }
}
