import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/banners.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/description.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/title.dart';

class AvailableDetailsNews extends StatelessWidget {
  const AvailableDetailsNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Meow, reading...",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            //? Title of news.
            ItemTitleNews(),
            //? Banner of news.
            ItemBannerNews(),
            SizedBox(height: 16),
            //? Description of news.
            ItemDescriptionNews(),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}