import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/preload/item.dart';

class PreloadLatestContent extends StatelessWidget {
  const PreloadLatestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: ScrollController(),
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return ItemPreloadedLatestNews(index: index);
      },
    );
  }
}
