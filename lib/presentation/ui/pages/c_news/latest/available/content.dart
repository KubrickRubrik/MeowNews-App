import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/item.dart';
import 'package:provider/provider.dart';

class AvailableLatestContent extends StatefulWidget {
  const AvailableLatestContent({super.key});

  @override
  State<AvailableLatestContent> createState() => _AvailableLatestContentState();
}

class _AvailableLatestContentState extends State<AvailableLatestContent> {
  final scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        if (scrollController.position.atEdge) {
          if (scrollController.position.pixels != 0) {
            context.read<NewsProvider>().getLatestNews();
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
        length: Model.pageData.newSet.listLatestdNews.length,
        status: Model.status.latest.statusScroll,
      ),
      builder: (_, model, __) {
        return ListView.separated(
          shrinkWrap: true,
          controller: scrollController,
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 56),
          itemCount: model.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, index) {
            if (index == model.length) {
              return SizedBox(
                  height: 56,
                  child: switch (model.status) {
                    StatusContent.isLoadContent => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    _ => const SizedBox.shrink(),
                  });
            }
            return ItemLatestNewsBanner(index);
          },
        );
      },
    );
  }
}
