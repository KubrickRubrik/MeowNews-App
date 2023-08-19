import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/indicator.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/item.dart';
import 'package:provider/provider.dart';

class AvailableLatestContent extends StatelessWidget {
  const AvailableLatestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, ({int length, StatusContent status})>(
      selector: (_, Model) => (
        length: Model.pageData.newSet.listLatestdNews.length,
        status: Model.status.latest.statusScroll,
      ),
      builder: (_, model, __) {
        return SliverList.separated(
          itemCount: model.length + 1,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (_, index) {
            if (index == model.length) {
              return SizedBox(
                  height: 100,
                  child: switch (model.status) {
                    StatusContent.isLoadContent => const ProgerssIndicator(color: 0xFF0B38C0, padding: 0),
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
