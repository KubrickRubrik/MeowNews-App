import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/domain/entities/vo/news.dart';
import 'package:news_test/presentation/manager/entity/dto/signpost.dart';
import 'package:news_test/presentation/ui/navigator/navigator.dart';

class TitleFeaturedNews extends StatefulWidget {
  const TitleFeaturedNews(this.index, this.news, {super.key});
  final int index;
  final NewsEntity news;

  @override
  State<TitleFeaturedNews> createState() => _TitleFeaturedNewsState();
}

class _TitleFeaturedNewsState extends State<TitleFeaturedNews> {
  bool isDisplayTitle = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!isDisplayTitle) {
          isDisplayTitle = !isDisplayTitle;
          setState(() {});
        } else {
          Navigator.pushNamed(
            context,
            PagesNavigator.newsDetailRoute,
            arguments: NewsSignpost(TargetNews.featured, widget.index),
          );
          isDisplayTitle = false;
          setState(() {});
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Text(
                widget.news.content.title,
                maxLines: 5,
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
