import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/not_available/content.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage(this.data, {super.key});
  final Object? data;

  @override
  Widget build(BuildContext context) {
    final news = locator<NewsProvider>().pageData.getItemNews(data as NewsSignpost);
    return switch (news) {
      null => const NotAvailableDetailsNews(),
      _ => AvailableDetailsNews(news),
    };
  }
}
