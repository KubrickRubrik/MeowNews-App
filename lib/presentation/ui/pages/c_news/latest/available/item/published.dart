import 'package:flutter/material.dart';
import 'package:news_test/domain/entities/vo/news.dart';

class PublishedLatestNews extends StatelessWidget {
  const PublishedLatestNews(this.news, {super.key});
  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    if (news.publishedAt == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(top: 4, right: 4),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xEE263238),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text(
            _makeDate(news.publishedAt!),
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  String _makeDate(DateTime publishedAt) {
    return "${publishedAt.day}-${publishedAt.month}-${publishedAt.year}";
  }
}
