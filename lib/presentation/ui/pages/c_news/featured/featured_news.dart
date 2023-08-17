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
          child: Selector<NewsProvider, StatusContent>(
            selector: (_, Model) => Model.status.statusFeaturedNews,
            builder: (_, status, child) {
              return switch (status) {
                StatusContent.isNoContent => const NotAvailableFeaturedContent(),
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
    return Selector<NewsProvider, StatusContent>(
      selector: (_, Model) => Model.status.statusFeaturedNews,
      builder: (_, status, child) {
        return switch (status) {
          StatusContent.isLoadContent => const PreloadFeaturedContent(),
          _ => child!,
        };
      },
      child: const AvailableFeatureContent(),
    );
  }
}
