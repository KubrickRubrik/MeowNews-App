import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/banners.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/description.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/title.dart';
import 'package:news_test/presentation/ui/pages/c_news_detail/available/widgets/viewed.dart';

class AvailableDetailsNews extends StatelessWidget {
  const AvailableDetailsNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text(
          context.lcz.titleNewsDetailPage,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A224A),
              Color(0xFF34407C),
              Color(0xFF1A224A),
            ],
          ),
        ),
        child: Column(
          children: [
            //? Viewed news before
            const IsViewedItemNews(),
            //? Main content
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 600,
                    ),
                    child: const Column(
                      children: [
                        //? Title of news.
                        ItemTitleNews(),
                        //? Banner of news.
                        ItemBannerNews(),
                        SizedBox(height: 16),
                        //? Description of news.
                        ItemDescriptionNews(),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
