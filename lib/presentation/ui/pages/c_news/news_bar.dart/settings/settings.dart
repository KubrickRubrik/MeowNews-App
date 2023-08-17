import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/settings/widgets/language.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/settings/widgets/sort.dart';

class BarSettions extends StatelessWidget {
  const BarSettions({super.key});

  @override
  Widget build(BuildContext context) {
    return const AnimatedCrossFade(
      duration: Duration(milliseconds: 300),
      sizeCurve: Curves.ease,
      crossFadeState: (true) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      firstChild: SizedBox.shrink(),
      secondChild: _WrapVariantOptions(),
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
