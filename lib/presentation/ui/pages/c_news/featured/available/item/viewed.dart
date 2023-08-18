import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';

class ViewedFeaturedNews extends StatelessWidget {
  const ViewedFeaturedNews(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, bool>(
      selector: (_, Model) => Model.pageData.newSet.listFeaturedNews.elementAt(index).viewed,
      builder: (_, viewed, child) {
        return switch (viewed) {
          false => const SizedBox.shrink(),
          true => child!,
        };
      },
      child: Container(
        margin: const EdgeInsets.only(left: 4, top: 4),
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000),
              offset: Offset(-0.5, -1.5),
            ),
            BoxShadow(
              color: Color(0xFFffffff),
              offset: Offset(0, 0),
              spreadRadius: 0.2,
              blurRadius: 0,
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Icon(
          IconsApp.completed,
          color: Color(0xFF00A505),
          size: 20,
        ),
      ),
    );
  }
}
