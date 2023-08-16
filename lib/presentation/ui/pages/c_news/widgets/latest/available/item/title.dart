import 'package:flutter/material.dart';
import 'package:news_test/domain/entities/vo/news.dart';

class TitleLatestNews extends StatelessWidget {
  const TitleLatestNews(this.news, {super.key});
  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4, bottom: 4),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xEE263238),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            news.content.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
