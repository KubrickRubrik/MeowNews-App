import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/not_available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/preload/content.dart';
import 'package:provider/provider.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: (MediaQuery.of(context).size.height / 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Selector<NewsProvider, StatusSection>(
            selector: (_, Model) => Model.status.featured.statusSection,
            builder: (_, status, child) {
              return switch (status) {
                StatusSection.isNoContent => const NotAvailableFeaturedContent(),
                _ => child!,
              };
            },
            child: const WrapFeaturedContent(),
          ),
        ),
      ),
    );
  }
}

class WrapFeaturedContent extends StatelessWidget {
  const WrapFeaturedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, StatusSection>(
      selector: (_, Model) => Model.status.featured.statusSection,
      builder: (_, status, child) {
        return switch (status) {
          StatusSection.isLoadContent => const PreloadFeaturedContent(),
          _ => child!,
        };
      },
      child: const AvailableFeatureContent(),
    );
  }
}
