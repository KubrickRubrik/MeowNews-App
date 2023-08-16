import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';

class NavigateFeaturedNews extends StatelessWidget {
  const NavigateFeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0.75,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            PagesNavigator.newsDetailRoute,
            arguments: 1,
          );
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(189, 0, 0, 0),
          ),
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.keyboard_double_arrow_right,
              color: Color(0xFFFFFFFF),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
