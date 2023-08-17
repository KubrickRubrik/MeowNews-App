import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/not_available/content.dart';
import 'package:provider/provider.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage(this.data, {super.key});
  final Object? data;

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  // @override
  // initState(){
  // There are two ways to download and display a detailed news description:
  // 1. Query news details when clicking on an `item news` in the list of news on the page [NewsPage];
  //    - In this case, will need to display the loading status on this `item news`.
  //    - The transition to the page for viewing the news is performed after the
  //      complete download of the necessary data.
  //
  // 2. Query news data after navigating to the [NewsDetailsPage] from the [NewsPage]
  //    - In this case, will need to display the loading status on all page [NewsDetailsPage].
  //    - The request will have to be executed in the InitState inside `WidgetsBinding.instance.addPostFrameCallback`
  //
  // For this example, the first option is chosen.
  //
  // Since the data source does not always provide idNews and the amount
  // of news data is small, the data is fetched from the [NewsProvider] list.
  // }

  @override
  void dispose() {
    locator<ItemNewsProvider>().reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: locator<ItemNewsProvider>(),
      child: Selector<ItemNewsProvider, bool>(
        selector: (_, Model) => Model.pageData.itemNews.isAvailable,
        builder: (_, isAvailable, child) {
          return switch (isAvailable) {
            false => const NotAvailableDetailsNews(),
            true => child!,
          };
        },
        child: const AvailableDetailsNews(),
      ),
    );
  }
}
