import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            return ItemLatestNewsBanner(index: index);
          },
        ),
      ),
    );
  }
}

class ItemLatestNewsBanner extends StatelessWidget {
  const ItemLatestNewsBanner({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            Material(
              color: Colors.transparent,
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
          ],
        ),
      ),
    );
  }
}
