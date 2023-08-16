import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage(this.data, {super.key});
  final Object? data;

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          children: [
            //? Banner of news.
            ItemBannerNews(),
            SizedBox(height: 16),
            //? Title of news.
            ItemTitleNews(),
            SizedBox(height: 16),
            //? Description of news.
            ItemDescriptionNews(),
          ],
        ),
      ),
    );
  }
}

class ItemBannerNews extends StatelessWidget {
  const ItemBannerNews({super.key});

  @override
  Widget build(BuildContext context) {
    return const AspectRatio(
      aspectRatio: 1.6,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Color(0xFFE0E0E0),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: FlutterLogo(),
      ),
    );
  }
}

class ItemTitleNews extends StatelessWidget {
  const ItemTitleNews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Очень длинное длинное описание новости, которое может занимать много места.",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    );
  }
}

class ItemDescriptionNews extends StatelessWidget {
  const ItemDescriptionNews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Очень длинное длинное описание новости, которое может занимать много места.",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}
