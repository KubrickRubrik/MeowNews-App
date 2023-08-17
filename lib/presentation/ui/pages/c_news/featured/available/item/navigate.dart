import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
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
          locator<ItemNewsProvider>().getDetailNews(TargetNews.featured, news.source.id, index).then((value) {
            if (value) {
              Navigator.pushNamed(
                context,
                PagesNavigator.newsDetailRoute,
                arguments: NewsSignpost(TargetNews.featured, index),
              );
            } else {
              ToastMassage.toast(context, "View news unavailable", code: TypeMassage.warning);
            }
          });
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
}
