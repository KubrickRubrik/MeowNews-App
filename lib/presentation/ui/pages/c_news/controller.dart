import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/bar.dart';
import 'package:news_test/presentation/ui/pages/c_news/appbar/button.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/featured_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/latest_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/preloader/preloader.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<NewsProvider>(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF37474F),
            centerTitle: false,
            title: Text(
              context.lcz.titleNewsPage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: const [
              ButtonettingViewedNews(),
            ],
          ),
          body: const Stack(
            children: [
              //? Main content
              Flex(
                direction: Axis.vertical,
                children: [
                  SizedBox(height: 8),
                  //? Featured news (horizontal scrolllist)
                  FeaturedNews(),
                  SizedBox(height: 4),
                  //? Set news and search options.
                  NewsOptionsBar(),
                  SizedBox(height: 8),
                  //? Featured news (vertical scrolllist)
                  LatestNews(),
                ],
              ),
              //? Spinner for open item news
              PreloaderContent(),
            ],
          ),
        ));
  }
}
