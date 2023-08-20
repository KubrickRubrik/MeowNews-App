import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/components/indicator.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/item.dart';
import 'package:provider/provider.dart';

class AvailableFeatureContent extends StatefulWidget {
  const AvailableFeatureContent({super.key});

  @override
  State<AvailableFeatureContent> createState() => _AvailableFeatureContentState();
}

class _AvailableFeatureContentState extends State<AvailableFeatureContent> {
  final scrollController = ScrollController();

  void listenScroll() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels != 0) {
        context.read<NewsProvider>().getFeaturedNews();
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(listenScroll);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(listenScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, ({int length, StatusContent status})>(
      selector: (_, Model) => (
        length: Model.pageData.newSet.listFeaturedNews.length,
        status: Model.status.featured.statusScroll,
      ),
      builder: (_, model, __) {
        return ListView.separated(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: model.length + 1,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, index) {
            if (index == model.length) {
              return SizedBox(
                  width: 56,
                  child: switch (model.status) {
                    StatusContent.isLoadContent => ProgerssIndicator(
                        color: context.theme.indicatorColor,
                        padding: 0,
                      ),
                    _ => const SizedBox.shrink(),
                  });
            }
            return ItemFeaturedNews(index: index);
          },
        );
      },
    );
  }
}
