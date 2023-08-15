import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 4),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, index) {
            return ItemFeaturedNewsBanner(index: index);
          },
        ),
      ),
    );
  }
}

class ItemFeaturedNewsBanner extends StatelessWidget {
  const ItemFeaturedNewsBanner({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                PagesNavigator.newsDetailRoute,
                arguments: index,
              );
            },
          ),
        ),
      ),
    );
  }
}
