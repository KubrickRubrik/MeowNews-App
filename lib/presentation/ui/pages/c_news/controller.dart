import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/widgets/button.dart';
import 'package:news_test/presentation/ui/pages/c_news/widgets/featured_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/widgets/latest_news.dart';
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
              "News",
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
              //? Featured news (horizontal scrolllist)
              FeaturedNews(),
              //? Featured news (vertical scrolllist)
              LatestNews(),
            ],
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: FloatingActionButton(
              onPressed: () {
                locator<NewsProvider>().getInitNews();
              },
              child: const Icon(Icons.touch_app),
            ),
          ),
        ));
  }
}
