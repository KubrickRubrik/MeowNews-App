part of '../provider.dart';

class _SessionData {
  int idApp = 0;
  final settings = _Settings();

  void setViewMenu() => settings.isViewed = !settings.isViewed;

  void setSettings({String? theme, String? locale}) {
    if (theme != null) settings.theme = ThemesController.getByName(theme);
    if (locale != null) settings.locale = LocalizationController.getByName(locale);
  }
}

class _Settings {
  bool isViewed = false;
  var theme = CurrentThemeApp.light;
  var locale = AvailableAppLocale.en;
}
