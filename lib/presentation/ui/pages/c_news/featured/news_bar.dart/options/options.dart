import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/options/widgets/button.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/options/widgets/language.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/options/widgets/sort.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/options/widgets/word.dart';

class BarOptions extends StatelessWidget {
  const BarOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 56,
        margin: const EdgeInsets.only(bottom: 2),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 3,
              spreadRadius: 0,
            ),
          ],
        ),
        child: const Flex(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          direction: Axis.horizontal,
          children: [
            Flexible(
              child: SectionLanguage(),
            ),
            Flexible(
              child: SectionSortBy(),
            ),
            SectionSearchWord(),
            //? Button search
            SectionButtonSearch(),
          ],
        ),
      ),
    );
  }
}
