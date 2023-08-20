import 'package:news_test/data/api/interfaces/api_shared.dart';
import 'package:news_test/data/models/news_bar.dart';
import 'package:news_test/data/models/session.dart';
import 'package:news_test/domain/entities/dto/news_bar.dart';
import 'package:news_test/domain/entities/dto/session.dart';
import 'package:news_test/domain/entities/interfaces/client_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Description ApiServer.
class SharedApi implements SharedApiRepository {
  // Session settings
  final themeOptions = 'themeOptions';
  final localeOptions = 'localeOptions';
  // News bar options
  final languageBarOptions = 'languageBarOptions';
  final sortBarOptions = 'sortBarOptions';

  @override
  Future<SessionModel> initSessionOptions() async {
    final prefs = await SharedPreferences.getInstance();
    var resTheme = prefs.getString(themeOptions);
    var resLocale = prefs.getString(localeOptions);
    //?
    if (resTheme != null && resLocale != null) {
      return SessionModel(theme: resTheme, locale: resLocale);
    }
    //?
    final response = SessionModel(theme: 'light', locale: 'ru');
    prefs.setString(themeOptions, response.theme);
    prefs.setString(localeOptions, response.locale);
    return response;
  }

  @override
  Future<bool> setSessionOptions(ClientDTO dto) async {
    (dto as SessionDTO);
    final prefs = await SharedPreferences.getInstance();
    //?
    if (dto.theme != null) prefs.setString(themeOptions, dto.theme!);
    if (dto.locale != null) prefs.setString(localeOptions, dto.locale!);
    //?
    return true;
  }

  @override
  Future<NewsBarModel?> getNewsBarData() async {
    final prefs = await SharedPreferences.getInstance();
    var resLanguage = prefs.getString(languageBarOptions);
    var resSort = prefs.getString(sortBarOptions);
    //?
    if (resLanguage == null || resSort == null) return null;
    //?
    return NewsBarModel(languageOptions: resLanguage, sortOptions: resSort);
  }

  @override
  Future<bool> setNewsBarData(ClientDTO dto) async {
    (dto as NewsBarDTO);
    final prefs = await SharedPreferences.getInstance();
    //?
    if (dto.languageOptions != null) prefs.setString(languageBarOptions, dto.languageOptions!);
    if (dto.sortOptions != null) prefs.setString(sortBarOptions, dto.sortOptions!);
    //?
    return true;
  }
}
