import 'package:news_test/data/models/session.dart';

final class SessionSettingsEntity {
  final String theme;
  final String locale;

  SessionSettingsEntity(SessionModel model)
      : theme = model.theme,
        locale = model.locale;
}
