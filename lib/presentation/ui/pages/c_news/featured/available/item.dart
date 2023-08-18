import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/image.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/item/featured.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/item/navigate.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/item/title.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/item/viewed.dart';
import 'package:provider/provider.dart';

class ItemFeaturedNews extends StatelessWidget {
  const ItemFeaturedNews({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final news = context.read<NewsProvider>().pageData.newSet.listFeaturedNews.elementAt(index);
    return AspectRatio(
      aspectRatio: 0.8,
      child: Container(
        width: 100,
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
            //? Banner
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: ComponentImage(news.banner.mainUrl),
            ),
            //? Title news
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: TitleFeaturedNews(index),
            ),
            //? Mark feature news (don't use)
            const Positioned(
              bottom: 0,
              left: 0,
              child: FeaturedNews(),
            ),
            //? Viewed news
            Positioned(
              top: 0,
              left: 0,
              child: ViewedFeaturedNews(index),
            ),
            //? Navigate to detail news
            Positioned(
              bottom: -60,
              right: -60,
              child: NavigateFeaturedNews(index),
            ),
          ],
        ),
      ),
    );
  }
}
