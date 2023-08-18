import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/not_available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/preload/content.dart';
import 'package:provider/provider.dart';

class SectionLatestNews extends StatelessWidget {
  const SectionLatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, StatusSection>(
      selector: (_, Model) => Model.status.latest.statusSection,
      builder: (_, statusSection, child) {
        return switch (statusSection) {
          StatusSection.isNoContent => const NotAvailableLatestContent(),
          StatusSection.isLoadContent => const PreloadLatestContent(),
          _ => child!,
        };
      },
      child: const AvailableLatestContent(),
    );
  }
}
