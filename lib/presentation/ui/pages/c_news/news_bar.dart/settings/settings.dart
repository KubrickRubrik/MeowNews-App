import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/settings/widgets/language.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/settings/widgets/sort.dart';
import 'package:provider/provider.dart';

class BarSettions extends StatelessWidget {
  const BarSettions({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewsProvider>().setDisplayNewsBar();
      },
      child: Selector<NewsProvider, bool>(
        selector: (_, Model) => Model.pageData.newBar.statusOpen,
        builder: (_, statusOpen, __) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.ease,
            crossFadeState: (!statusOpen) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const SizedBox.shrink(),
            secondChild: const _WrapVariantOptions(),
          );
        },
      ),
    );
  }
}

class _WrapVariantOptions extends StatelessWidget {
  const _WrapVariantOptions({super.key});

  @override
  Widget build(BuildContext context) {
    int a = 1;
    return switch (a) {
      1 => const NewsLanguageSettings(),
      _ => const NewsSortSettings(),
    };
  }
}
