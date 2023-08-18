import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/settings/widgets/language.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/settings/widgets/sort.dart';
import 'package:provider/provider.dart';

class BarSettions extends StatelessWidget {
  const BarSettions({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewsProvider>().setDisplayNewsBar();
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 56, left: 8, right: 8),
        color: const Color(0xFFFDFDFD),
        child: const _WrapVariantOptions(),
      ),
    );
  }
}

class _WrapVariantOptions extends StatelessWidget {
  const _WrapVariantOptions();

  @override
  Widget build(BuildContext context) {
    int a = 1;
    return switch (a) {
      1 => const NewsLanguageSettings(),
      _ => const NewsSortSettings(),
    };
  }
}
