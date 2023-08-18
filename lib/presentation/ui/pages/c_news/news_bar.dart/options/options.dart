import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/options/widgets/button.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/options/widgets/language.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/options/widgets/sort.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/options/widgets/word.dart';

class BarOptions extends StatelessWidget {
  const BarOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: 56,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: SectionLanguage(),
          ),
          _EdgeSection(),
          Expanded(
            child: SectionSortBy(),
          ),
          _EdgeSection(),
          Flexible(
            child: SectionSearchWord(),
          ),
          //? Button search
          SectionButtonSearch(),
        ],
      ),
    );
  }
}

class _EdgeSection extends StatelessWidget {
  const _EdgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 6,
      child: Center(
        child: Container(
          height: 6,
          width: 6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
    );
  }
}
