import 'package:flutter/material.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/banners.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/description.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/title.dart';

class AvailableDetailsNews extends StatelessWidget {
  const AvailableDetailsNews(this.news, {super.key});
  final NewsEntity news;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Reading the news",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            //? Title of news.
            ItemTitleNews(news.content.title),
            //? Banner of news.
            ItemBannerNews(news.banner.mainUrl),
            const SizedBox(height: 16),
            //? Description of news.
            ItemDescriptionNews(news.content.description),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
