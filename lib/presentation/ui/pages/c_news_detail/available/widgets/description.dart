import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:provider/provider.dart';

class ItemDescriptionNews extends StatelessWidget {
  const ItemDescriptionNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ItemNewsProvider, String?>(
      selector: (_, Model) => Model.pageData.itemNews.content.description,
      builder: (_, description, child) {
        return switch (description) {
          null => const SizedBox.shrink(),
          _ => Text(
              description,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        };
      },
    );
  }
}
