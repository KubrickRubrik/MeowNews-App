import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';

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

  // All available themes
  static Map<CurrentThemeApp, String> defaultThemes(BuildContext context) => {
        CurrentThemeApp.light: context.lcz.themeSettingsLight,
        CurrentThemeApp.dark: context.lcz.themeSettingsDark,
      };

  static CurrentThemeApp getByName(String value) {
    return switch (value) {
      'dark' => CurrentThemeApp.dark,
      _ => CurrentThemeApp.light,
    };
  }
}
// Comfortaa