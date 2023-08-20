import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_loc.dart';

extension EContext on BuildContext {
  // To simplify obtaining honey parameters
  MediaQueryData get media => MediaQuery.of(this);
  // To simplify obtaining honey parameters
  ThemeData get theme => Theme.of(this);
  // To get the current localization of an application
  AppLocalization get lcz => AppLocalization.of(this)!;
}
