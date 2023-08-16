import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/item/banner.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/item/title.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/item/viewed.dart';
import 'package:provider/provider.dart';

class ItemLatestNewsBanner extends StatelessWidget {
  const ItemLatestNewsBanner({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final news = context.read<NewsProvider>().pageData.newSet.listLatestdNews.elementAt(index);
    print(news.banner.mainUrl);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          PagesNavigator.newsDetailRoute,
          arguments: NewsSignpost(TargetNews.latest, index),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //? Title
          TitleLatestNews(news),
          //? Banner
          AspectRatio(
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
                  //? Banner
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: BannerLatestNews(news.banner.mainUrl),
                  ),

                  //? Title news
                  // Positioned(
                  //   bottom: 0,
                  //   left: 0,
                  //   right: 0,
                  //   child: TitleLatestNews(news),
                  // ),
                  //? PublishedAt
                  // Positioned(
                  //   top: 0,
                  //   right: 0,
                  //   child: PublishedLatestNews(news),
                  // ),
                  //? Viewed news
                  const Positioned(
                    top: 0,
                    left: 0,
                    child: ViewedLatestNews(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
