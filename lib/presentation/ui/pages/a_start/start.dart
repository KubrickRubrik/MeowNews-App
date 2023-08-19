import 'package:flutter/material.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/session/provider.dart';
import 'package:news_test/presentation/ui/components/localization/controller.dart';
import 'package:news_test/presentation/ui/components/themes/controller.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';
import 'package:news_test/presentation/ui/pages/c_news/controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_gen/gen_l10n/app_loc.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<SessionProvider>(),
      child: Selector<SessionProvider, ({AvailableAppLocale locale, CurrentThemeApp theme})>(
        selector: (_, Model) => (locale: Model.pageData.locale, theme: Model.pageData.theme),
        builder: (_, model, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //? Installing a theme
            theme: ThemesController.set(model.theme),
            //? Installing localization
            locale: LocalizationController.getByType(model.locale),
            supportedLocales: AppLocalization.supportedLocales,
            localizationsDelegates: AppLocalization.localizationsDelegates,
            //? Main
            title: 'MeowNews',
            home: const NewsPage(),
            scrollBehavior: AppScrollBehavior(),
            //? Layout correction
            // builder: DevicePreview.appBuilder,
            //? Navigation
            onGenerateRoute: PagesNavigator.goRoutes,
          );
        },
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
