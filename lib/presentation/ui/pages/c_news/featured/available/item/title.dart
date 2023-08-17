import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
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
          locator<ItemNewsProvider>().getDetailNews(TargetNews.featured, news.source.id, widget.index).then((isDone) {
            if (isDone) {
              //
              Navigator.pushNamed(
                context,
                PagesNavigator.newsDetailRoute,
                arguments: NewsSignpost(TargetNews.featured, widget.index),
              );
              //
              isDisplayTitle = false;
              setState(() {});
            } else {
              ToastMassage.toast(context, "View news unavailable", code: TypeMassage.warning);
            }
          });
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
              padding: const EdgeInsets.all(16.0),
              child: Text(
                news.content.title,
                maxLines: 6,
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
        ),
      ),
    );
  }
}
