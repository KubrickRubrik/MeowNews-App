import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
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
        title: Text(
          context.lcz.titleNewsDetailPage,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A224A),
              Color(0xFF34407C),
              Color(0xFF1A224A),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
