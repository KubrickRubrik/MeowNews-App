import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';

/// The class for managing the application's theme.
abstract final class ThemesController {
  // Setting and changing the theme on a page [StartPage].
  static ThemeData set(CurrentThemeApp value) {
    return switch (value) {
      CurrentThemeApp.dark => ThemeData(
          fontFamily: 'Comfortaa',
          colorScheme: const ColorScheme.dark(),
        ),
      CurrentThemeApp.light => ThemeData(
          fontFamily: 'Comfortaa',
          colorScheme: const ColorScheme.light(),
        ),
    };
  }
}
// Comfortaa