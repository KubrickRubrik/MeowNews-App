import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/components/toast.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';
import 'package:provider/provider.dart';

class NavigateFeaturedNews extends StatelessWidget {
  const NavigateFeaturedNews(this.index, {super.key});
  final int index;

  @override
  Widget build(BuildContext context) {
    final news = context.read<NewsProvider>().pageData.newSet.listFeaturedNews.elementAt(index);
    return Transform.rotate(
      angle: 0.75,
      child: InkWell(
        onTap: () {
          openItemNewsPage(context, idNews: news.source.id, index: index);
        },
        child: Container(
          height: 100,
          width: 100,
          decoration: const BoxDecoration(
            color: Color.fromARGB(189, 0, 0, 0),
          ),
          alignment: Alignment.centerLeft,
          child: const Padding(
            padding: EdgeInsets.only(left: 4.0),
            child: Icon(
              Icons.keyboard_double_arrow_right,
              color: Color(0xFFFFFFFF),
              size: 20,
            ),
          ),
        ),
      ),
    );
  }

  // Open the page for viewing news details.
  // - 1. The news data is being loaded by [NewsProvider].
  //      The user is shown a download spinner.
  // - 2. If the data is loaded, the transition to the page for viewing
  //      the details of the news is performed.
  // - 3. If the data is not loaded, a warning about the lack of news data is displayed.
  void openItemNewsPage(BuildContext context, {required String idNews, required int index}) {
    context.read<NewsProvider>().getItemNewsDetail(TargetNews.featured, idNews: idNews, index: index).then((itemNews) {
      if (itemNews == null) {
        ToastMassage.toast(context, context.lcz.viewNewsUnavailableToast, code: TypeMassage.warning);
        return;
      }
      locator<ItemNewsProvider>().setItemNews(itemNews);
      context.read<NewsProvider>().setNewsViewedStatus([itemNews.source.id]);
      Navigator.pushNamed(context, PagesNavigator.newsDetailRoute);
    });
  }
}
