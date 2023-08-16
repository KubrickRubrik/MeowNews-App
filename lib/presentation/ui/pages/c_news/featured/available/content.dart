import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/item.dart';
import 'package:provider/provider.dart';

class AvailableFeatureContent extends StatefulWidget {
  const AvailableFeatureContent({super.key});

  @override
  State<AvailableFeatureContent> createState() => _AvailableFeatureContentState();
}

class _AvailableFeatureContentState extends State<AvailableFeatureContent> {
  final scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            context.read<NewsProvider>().getFeaturedNews();
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, ({int length, StatusContent status})>(
      selector: (_, Model) => (
        length: Model.pageData.newSet.listFeaturedNews.length,
        status: Model.status.statusFeaturedNews,
      ),
      builder: (_, model, __) {
        return ListView.separated(
          controller: scrollController,
          padding: const EdgeInsets.only(bottom: 4),
          scrollDirection: Axis.horizontal,
          itemCount: model.length + 1,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, index) {
            if (index == model.length) {
              switch (model.status) {
                case StatusContent.isLoadContent:
                  return const SizedBox(
                    width: 60,
                    child: CircularProgressIndicator.adaptive(),
                  );
                case StatusContent.isEmptyContent:
                  return const SizedBox.shrink();
                default:
                  return const SizedBox.shrink();
              }
            }
            return ItemFeaturedNews(index: index);
          },
        );
      },
    );
  }
}
