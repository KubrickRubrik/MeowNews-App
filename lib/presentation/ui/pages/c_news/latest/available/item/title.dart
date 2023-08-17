import 'package:flutter/material.dart';
import 'package:news_test/domain/entities/vo/news.dart';

class TitleLatestNews extends StatelessWidget {
  const TitleLatestNews(this.news, {super.key});
  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
      child: Text(
        news.content.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Color(0xFF37474F),
          fontWeight: FontWeight.bold,
          fontSize: 16,
          height: 1.4,
        ),
      ),
    );
  }
}
