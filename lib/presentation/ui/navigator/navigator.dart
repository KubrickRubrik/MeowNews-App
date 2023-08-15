import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/controller.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/controller.dart';

abstract final class PagesNavigator {
  static Route<dynamic>? goRoutes(RouteSettings settings) {
    ({String? route, Object? arguments}) path = (route: settings.name, arguments: settings.arguments);

    if (path.route == null) return null;
    if (path.route == '/') {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => const NewsPage(),
        transitionsBuilder: _transitSlide,
      );
    } else if (path.route == '/news_detail') {
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => DetailNewsItemPage(path.arguments),
        transitionsBuilder: _transitFade,
      );
    } else {
      return null;
    }
  }

  /// Fade
  static Widget _transitFade(_, Animation<double> animation, Animation<double> secAnimation, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  /// Slide
  static Widget _transitSlide(_, Animation<double> animation, Animation<double> secAnimation, child) {
    const begin = Offset(1, 1);
    const end = Offset.zero;
    const curve = Curves.easeOut;

    final tween = Tween(begin: begin, end: end);
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return SlideTransition(
      position: tween.animate(curvedAnimation),
      child: child,
    );
  }
}
