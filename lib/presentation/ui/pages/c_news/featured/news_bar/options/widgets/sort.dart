import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:provider/provider.dart';

class SectionSortBy extends StatelessWidget {
  const SectionSortBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<NewsProvider>().setDisplayNewsBar(TargetSettingsNewsBar.setSort);
        },
        child: Center(
          child: Selector<NewsProvider, AvailableNewsSorting>(
            selector: (_, Model) => Model.pageData.newsSearchBar.options.sortOptions,
            builder: (_, option, __) {
              return Text(
                prepareTitleOptions(context, option),
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              );
            },
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
