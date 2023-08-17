import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:news_test/presentation/ui/components/image.dart';
import 'package:news_test/presentation/ui/components/toast.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/item/title.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/item/viewed.dart';
import 'package:provider/provider.dart';

class ItemLatestNewsBanner extends StatelessWidget {
  const ItemLatestNewsBanner(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    final news = context.read<NewsProvider>().pageData.newSet.listLatestdNews.elementAt(index);
    return InkWell(
      onTap: () {
        locator<ItemNewsProvider>().getDetailNews(TargetNews.latest, news.source.id, index).then((value) {
          if (value) {
            Navigator.pushNamed(
              context,
              PagesNavigator.newsDetailRoute,
              arguments: NewsSignpost(TargetNews.latest, index),
            );
          } else {
            ToastMassage.toast(context, "View news unavailable", code: TypeMassage.warning);
          }
        });
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
                    child: ComponentImage(news.banner.mainUrl),
                  ),
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
