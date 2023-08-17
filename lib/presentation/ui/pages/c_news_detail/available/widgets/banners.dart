import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:news_test/presentation/ui/components/image.dart';
import 'package:provider/provider.dart';

class ItemBannerNews extends StatelessWidget {
  const ItemBannerNews({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 2,
              spreadRadius: -1,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Selector<ItemNewsProvider, String?>(
          selector: (_, Model) => Model.pageData.itemNews.banner.mainUrl,
          builder: (_, url, child) {
            return ComponentImage(url, asset: ImagesApp.launch);
            // return switch (url) {
            //   null => child!,
            //   _ => FadeInImage.assetNetwork(
            //       placeholder: ImagesApp.image2,
            //       image: url,
            //     ),
            // };
          },
          child: Image.asset(ImagesApp.image3),
        ),
      ),
    );
  }
}
