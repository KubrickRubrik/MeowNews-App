import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:provider/provider.dart';

class SectionButtonSearch extends StatelessWidget {
  const SectionButtonSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 1),
      width: 56,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      alignment: Alignment.center,
      child: Selector<NewsProvider, (StatusContent, StatusContent)>(
        selector: (_, Model) => (Model.status.statusFeaturedNews, Model.status.statusLatestNews),
        builder: (_, model, child) {
          return switch ((model.$1, model.$2)) {
            (StatusContent.isLoadContent || StatusContent.isLoadContent) => const CircularProgressIndicator.adaptive(),
            (StatusContent.isNoContent || StatusContent.isNoContent) => const _ButtonUpdateSearch(),
            _ => child!,
          };
        },
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: const Center(
              child: Icon(
                Icons.double_arrow_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ButtonGoSearch extends StatelessWidget {
  const _ButtonGoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          //  context.read<NewsProvider>().getInitNews();
        },
        child: const Center(
          child: Icon(
            Icons.double_arrow_outlined,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}

class _ButtonUpdateSearch extends StatelessWidget {
  const _ButtonUpdateSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<NewsProvider>().getInitNews();
        },
        child: const Center(
          child: Icon(
            Icons.update,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
