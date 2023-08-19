import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:provider/provider.dart';

class SectionLanguage extends StatelessWidget {
  const SectionLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<NewsProvider>().setDisplayNewsBar(TargetSettingsNewsBar.setLanguage);
        },
        child: SizedBox(
          width: 56,
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Selector<NewsProvider, AvailableNewsLanguages>(
                selector: (_, Model) => Model.pageData.newsSearchBar.options.languageOptions,
                builder: (_, options, __) {
                  return Text(
                    options.name.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
