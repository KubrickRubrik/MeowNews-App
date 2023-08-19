/// Session state of the application/user.
enum StateApp { errorRepairs, isAuth, isNotAuth }

/// Available interface themes for selection in the application.
enum CurrentThemeApp { light, dark }

/// Available languages for selection in the app.
enum AvailableAppLocale { ru, en }

/// Activity activity status.
enum ActionStatus { isAction, isDone }

/// Content loading status.
enum StatusContent {
  isLoadContent,
  isNoContent,
  isEmptyContent,
  isViewContent,
}

/// Section loading status.
enum StatusSection {
  isLoadContent,
  isNoContent,
  isViewContent,
}

/// News viewing status.
enum StatusViewed {
  isLoadContent,
  isNotViewed,
  isViewed,
}

/// Type of toast.
enum TypeMassage { good, massage, error, warning }

/// Тews country
enum TargetNews { latest, featured }

/// Available languages for news search.
enum AvailableNewsLanguages { en, ru }

/// Available languages for news search.
enum AvailableNewsSorting { relevancy, popularity, publishedAt }

enum TargetSettingsNewsBar { isClosed, setLanguage, setSort, publishedAt }
