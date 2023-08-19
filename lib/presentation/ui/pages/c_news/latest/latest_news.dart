import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/not_available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/preload/content.dart';
import 'package:provider/provider.dart';

class SectionLatestNews extends StatelessWidget {
  const SectionLatestNews(this.scrollController, {super.key});
  final ScrollController scrollController;
  
  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, StatusSection>(
      selector: (_, Model) => Model.status.latest.statusSection,
      builder: (_, statusSection, child) {
        // To update the news section UI state, only the `statusSection` is updated.
        // To update the state of the UI caused by a content loading scroll,
        // use statusScroll in [AvailableLatestContent].
        updateScrollController();
        return switch (statusSection) {
          StatusSection.isNoContent => const NotAvailableLatestContent(),
          StatusSection.isLoadContent => const PreloadLatestContent(),
          _ => child!,
        };
      },
      child: const AvailableLatestContent(),
    );
  }

  // When the status changes for all sections, the scrollController offset
  // is moved to the starting position `scrollController.jumpTo(0)`.
  void updateScrollController() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.jumpTo(0);
    });
  }
}
