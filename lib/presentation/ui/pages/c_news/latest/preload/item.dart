import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';

class ItemPreloadedLatestNews extends StatelessWidget {
  const ItemPreloadedLatestNews({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 1), blurRadius: 2, spreadRadius: -1),
          ],
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
                    arguments: NewsSignpost(TargetNews.featured, index),
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