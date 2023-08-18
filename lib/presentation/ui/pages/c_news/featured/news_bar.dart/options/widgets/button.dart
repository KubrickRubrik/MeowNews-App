import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
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
      child: Selector<NewsProvider, (StatusSection, StatusSection)>(
        selector: (_, Model) => (Model.status.featured.statusSection, Model.status.latest.statusSection),
        builder: (_, model, child) {
          if ([model.$1, model.$2].contains(StatusSection.isLoadContent)) return const CircularProgressIndicator.adaptive();
          if ([model.$1, model.$2].contains(StatusSection.isNoContent)) return const _ButtonUpdateSearch();
          return child!;
        },
        child: const _ButtonGoSearch(),
      ),
    );
  }
}

class _ButtonGoSearch extends StatelessWidget {
  const _ButtonGoSearch();

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
  const _ButtonUpdateSearch();

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
