import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
part 'state.dart';
part 'entity/page_data.dart';

/// This class will be used when it becomes necessary to add a user's session state.
///
/// Also, this class is responsible for user settings: application theme, language,
/// voice acting (if a more complex configuration model is not required).
///
/// Currently the user session is not in use and the class is added for
/// demonstration purposes only.
final class SessionProvider extends ChangeNotifier with _State {
  // 1. User session data request.
  // 2. Localization settings.
  // 3. Theme customization.
}
