part of '../provider.dart';

final class NewsSearchBar {
  // Main data
  final options = _SearchOptions();
  // Status display newsBar
  var statusViewedBar = TargetSettingsNewsBar.isClosed;

  // Status display settings bar
  void _setStatusOpen(TargetSettingsNewsBar? val) {
    if (val != null) {
      if (statusViewedBar == val) {
        statusViewedBar = TargetSettingsNewsBar.isClosed;
      } else {
        statusViewedBar = val;
      }
    } else {
      statusViewedBar = TargetSettingsNewsBar.isClosed;
    }
  }

  // Set settings NewsSearchBar
  void setOptions({required String? languageOptions, required String? sortOptions}) {
    if (languageOptions != null) options.languageOptions = options.getAvailableLanguage(languageOptions);
    if (sortOptions != null) options.sortOptions = options.getAvailableSort(sortOptions);
  }

  // Setting the news search word.
  void setSearchWord(String val) {
    options.wordOptions = val;
  }

  // Setting the news search language.
  void setLanguageOptions(AvailableNewsLanguages val) {
    options.languageOptions = val;
  }

  // Setting the type of news search sorting.
  void setSortOptions(AvailableNewsSorting val) {
    options.sortOptions = val;
  }
}

final class _SearchOptions {
  String wordOptions = 'IT';
  var languageOptions = AvailableNewsLanguages.ru;
  var sortOptions = AvailableNewsSorting.publishedAt;
  // Number of downloaded news in one request (for one page).
  final _featuredNewsCount = 6;
  final _latestNewsCount = 12;

  // Getting the search word.
  String get getSearchWord => wordOptions.isEmpty ? 'IT' : wordOptions;

  // Setting the news language.
  AvailableNewsLanguages getAvailableLanguage(String locale) {
    return switch (locale) {
      'ru' => AvailableNewsLanguages.ru,
      _ => AvailableNewsLanguages.en,
    };
  }

  // Setting the type of news sorting.
  AvailableNewsSorting getAvailableSort(String sort) {
    return switch (sort) {
      'popularity' => AvailableNewsSorting.popularity,
      'relevancy' => AvailableNewsSorting.relevancy,
      _ => AvailableNewsSorting.publishedAt,
    };
  }
}
