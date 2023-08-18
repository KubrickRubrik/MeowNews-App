import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/not_available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/preload/content.dart';
import 'package:provider/provider.dart';

class LatestNews extends StatelessWidget {
  const LatestNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Selector<NewsProvider, StatusSection>(
            selector: (_, Model) => Model.status.latest.statusSection,
            builder: (_, status, child) {
              return switch (status) {
                StatusSection.isNoContent => const NotAvailableLatestContent(),
                _ => child!,
              };
            },
            child: const WrapLatestContent(),
          ),
        ),
      ),
    );
  }
}

class WrapLatestContent extends StatelessWidget {
  const WrapLatestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, StatusSection>(
      selector: (_, Model) => Model.status.latest.statusSection,
      builder: (_, status, child) {
        return switch (status) {
          StatusSection.isLoadContent => const PreloadLatestContent(),
          _ => child!,
        };
      },
      child: const AvailableLatestContent(),
    );
  }
}
