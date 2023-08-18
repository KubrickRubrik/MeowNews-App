import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/preload/item.dart';

class PreloadFeaturedContent extends StatelessWidget {
  const PreloadFeaturedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: ScrollController(),
      padding: const EdgeInsets.only(bottom: 4),
      scrollDirection: Axis.horizontal,
      itemCount: 8,
      separatorBuilder: (_, __) => const SizedBox(width: 8),
      itemBuilder: (_, index) {
        return ItemPreloadedFeaturedNews(index: index);
      },
    );
  }
}
