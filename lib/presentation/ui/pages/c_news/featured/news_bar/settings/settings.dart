import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar/settings/widgets/language.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar/settings/widgets/sort.dart';
import 'package:provider/provider.dart';

class BarSettions extends StatefulWidget {
  const BarSettions({super.key});

  @override
  State<BarSettions> createState() => _BarSettionsState();
}

class _BarSettionsState extends State<BarSettions> {
  bool isDispaly = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          isDispaly = true;
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewsProvider>().setDisplayNewsBar();
      },
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
        opacity: isDispaly ? 1 : 0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 56),
          child: Selector<NewsProvider, TargetSettingsNewsBar>(
            selector: (_, Model) => Model.pageData.newsSearchBar.statusViewedBar,
            builder: (_, status, __) {
              return switch (status) {
                TargetSettingsNewsBar.setLanguage => const NewsLanguageSettings(),
                TargetSettingsNewsBar.setSort => const NewsSortSettings(),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ),
      ),
    );
  }
}
