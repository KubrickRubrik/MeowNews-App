import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:provider/provider.dart';

class ItemTitleNews extends StatelessWidget {
  const ItemTitleNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Selector<ItemNewsProvider, String>(
        selector: (_, Model) => Model.pageData.itemNews.content.title,
        builder: (_, title, __) {
          return Text(
            title,
            style: TextStyle(
              color: Colors.indigo.shade700,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          );
        },
      ),
    );
  }
}
