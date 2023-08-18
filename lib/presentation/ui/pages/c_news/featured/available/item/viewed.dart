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
      child: const Padding(
        padding: EdgeInsets.only(left: 8, top: 8),
        child: Icon(
          IconsApp.completed,
          color: Color(0xFF65F436),
          size: 30,
          shadows: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 1,
            ),
          ],
        ),
      ),
    );
  }
}
