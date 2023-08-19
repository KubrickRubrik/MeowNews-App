import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/preload/item.dart';

class PreloadLatestContent extends StatelessWidget {
  const PreloadLatestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate.fixed(
        List.generate(10, (index) => ItemPreloadedLatestNews(index: index)),
      ),
    );
  }
}
