import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/controller.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/controller.dart';

abstract final class PagesNavigator {
  static const newsDetailRoute = "/news_detail";

  static Route<dynamic>? goRoutes(RouteSettings settings) {
    ({String? route, Object? arguments}) path = (route: settings.name, arguments: settings.arguments);

    if (path.route == null) return null;
    if (path.route == '/') {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const NewsPage(),
        transitionsBuilder: _transitFade,
      );
    } else if (path.route == newsDetailRoute) {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const ItemNewsDetailsPage(),
        transitionsBuilder: _transitFade,
      );
    } else {
      return null;
    }
  }

  /// Fade.
  static Widget _transitFade(_, Animation<double> animation, Animation<double> secAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
