import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/bar.dart';
import 'package:news_test/presentation/ui/pages/c_news/appbar/button.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/featured_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/latest_news.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<NewsProvider>(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey.shade800,
            centerTitle: false,
            title: const Text(
              "Meow, news",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: const [
              ButtonettingViewedNews(),
            ],
          ),
          body: const Flex(
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
          // bottomNavigationBar: SizedBox(
          //   height: 80,
          //   child: FloatingActionButton(
          //     onPressed: () {
          //       locator<NewsProvider>().getInitNews();
          //     },
          //     child: const Icon(Icons.touch_app),
          //   ),
          // ),
        ));
  }
}
