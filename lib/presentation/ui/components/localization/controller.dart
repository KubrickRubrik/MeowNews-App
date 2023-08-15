import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';

/// Class for working with user's locale app.
abstract final class LocalizationController {
  // Default list language available for app.
  static Map<AvailableAppLocale, AppLanguage> get defaultLanguage => {
        AvailableAppLocale.en: const AppLanguage('en', 'English'),
        AvailableAppLocale.ru: const AppLanguage('ru', 'Русский'),
      };

  // Get locale by type.
  static Locale getByType(AvailableAppLocale value) {
    return switch (value) {
      AvailableAppLocale.en => const Locale('en', 'US'),
      AvailableAppLocale.ru => const Locale('ru', 'RU'),
    };
  }

  // Get locale by name.
  static AvailableAppLocale getByName(String name) {
    return switch (name) {
      'ru' => AvailableAppLocale.ru,
      'en' => AvailableAppLocale.en,
      _ => AvailableAppLocale.en,
    };
  }
}

class AppLanguage {
  const AppLanguage(this.code, this.title);
  final String code;
  final String title;
}
