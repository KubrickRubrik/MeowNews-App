import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/domain/entities/dto/session.dart';
import 'package:news_test/domain/use_cases/session.dart';
import 'package:news_test/presentation/ui/components/localization/controller.dart';
import 'package:news_test/presentation/ui/components/themes/controller.dart';
part 'state.dart';
part 'entity/session.dart';

/// This class will be used when it becomes necessary to add a user's session state.
///
/// Also, this class is responsible for user settings: application theme, language,
/// (if a more complex configuration model is not required).
final class SessionProvider extends ChangeNotifier with _State {
  SessionProvider(this._sessionCase);
  final SessionCase _sessionCase;
  // 1. User session data request.
  // 2. Localization settings.
  // 3. Theme customization.

  Future<void> initSettings() async {
    if (actionStatus == ActionStatus.isAction) return;
    _setActionsPage(ActionStatus.isAction);
    //? Request.
    final response = await _sessionCase.initSettingsOptions();
    _setActionsPage(ActionStatus.isDone);
    //? Checking for failure.
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
      return;
    }
    session.setSettings(theme: response.data!.theme, locale: response.data!.locale);
    notifyListeners();
  }

  // Set theme
  Future<void> setSettings({CurrentThemeApp? theme, AvailableAppLocale? locale}) async {
    if (theme == null && locale == null) return;
    if (theme == session.settings.theme && locale == session.settings.locale) return;
    if (actionStatus == ActionStatus.isAction) return;
    _setActionsPage(ActionStatus.isAction);
    //? Formation of request parameters.
    final dto = SessionDTO(
      theme: theme?.name,
      locale: locale?.name,
    );
    //? Request.
    final response = await _sessionCase.setSettingsOptions(dto);

    _setActionsPage(ActionStatus.isDone);
    //? Checking for failure.
    if (response.fail != null || response.data == null) {
      print(response.fail?.msg);
      return;
    }

    //? Check correct data
    if (!response.data!) return;
    //?

    session.setSettings(theme: theme?.name, locale: locale?.name);
    notifyListeners();
  }

  // View settings panel
  void setViewMenuSettings() {
    session.setViewMenu();
    notifyListeners();
  }
}
