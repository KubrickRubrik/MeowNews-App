import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/not_available/content.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage(this.data, {super.key});
  final Object? data;

  // @override
  // initState(){
  // In this part (for Stateful), it would be necessary to execute a request
  // to download the detailed data of the news, using, for example,
  // locator <ItemNewsProvider >().getDetails(idNews).
  //
  // Since the data source does not always provide idNews and the amount
  // of news data is small, the data is fetched from the NewsProvider.
  //
  // Sometimes it is better to load the data before going to the detail view page...
  // A request to download news data would also have to mark the news as read.
  //
  // For simplicity, in this example, all this is done on the NewsPage after clicking on the news.
  // }

  @override
  Widget build(BuildContext context) {
    final news = locator<NewsProvider>().pageData.getItemNews(data as NewsSignpost);
    return switch (news) {
      null => const NotAvailableDetailsNews(),
      _ => AvailableDetailsNews(news),
    };
  }
}
