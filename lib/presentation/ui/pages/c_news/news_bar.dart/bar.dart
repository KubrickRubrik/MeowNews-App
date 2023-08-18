import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/options/options.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/settings/settings.dart';

class NewsOptionsBar extends StatelessWidget {
  const NewsOptionsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BarOptions(),
        BarSettions(),
      ],
    );
  }
}
