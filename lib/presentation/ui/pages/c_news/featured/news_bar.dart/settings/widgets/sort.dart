import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:provider/provider.dart';

class NewsSortSettings extends StatelessWidget {
  const NewsSortSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.media.size.height / (4 * 3) - 6;
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        runSpacing: 10,
        children: [
          _ItemOption(AvailableNewsSorting.relevancy, size: size),
          _ItemOption(AvailableNewsSorting.publishedAt, size: size),
        ],
      ),
    );
  }

  List<Widget> _prepareOptions(double size) {
    return AvailableNewsSorting.values.map((e) {
      return _ItemOption(e, size: size);
    }).toList();
  }
}

class _ItemOption extends StatelessWidget {
  const _ItemOption(this.option, {super.key, required this.size});
  final AvailableNewsSorting option;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewsProvider>().setSortOptions(option);
      },
      child: Container(
        padding: EdgeInsets.only(top: size / 2 - 10, left: 20, right: 20),
        height: size,
        decoration: BoxDecoration(
          color: (option == context.read<NewsProvider>().pageData.newsSearchBar.options.sortOptions) ? const Color(0xFFD6E7FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          prepareTitleOptions(context, option),
          style: const TextStyle(
            color: Color(0xFF124C9C),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  // Select a text sort name.
  String prepareTitleOptions(BuildContext context, AvailableNewsSorting option) {
    return switch (option) {
      AvailableNewsSorting.popularity => context.lcz.sortPopularity,
      AvailableNewsSorting.relevancy => context.lcz.sortRelevance,
      AvailableNewsSorting.publishedAt => context.lcz.sortLast,
    };
  }
}
