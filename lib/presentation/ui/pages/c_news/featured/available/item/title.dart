import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/components/toast.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';
import 'package:provider/provider.dart';

class TitleFeaturedNews extends StatefulWidget {
  const TitleFeaturedNews(this.index, {super.key});
  final int index;

  @override
  State<TitleFeaturedNews> createState() => _TitleFeaturedNewsState();
}

class _TitleFeaturedNewsState extends State<TitleFeaturedNews> {
  bool isDisplayTitle = false;

  @override
  Widget build(BuildContext context) {
    final news = context.read<NewsProvider>().pageData.newSet.listFeaturedNews.elementAt(widget.index);
    return InkWell(
      onTap: () {
        if (!isDisplayTitle) {
          isDisplayTitle = !isDisplayTitle;
          setState(() {});
        } else {
          openItemNewsPage(context, idNews: news.source.id, index: widget.index);
        }
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: isDisplayTitle ? 1 : 0,
        curve: Curves.ease,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xEE263238),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 36),
              child: Text(
                news.content.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
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
      isDisplayTitle = false;
      if (mounted) setState(() {});
    });
  }
}
