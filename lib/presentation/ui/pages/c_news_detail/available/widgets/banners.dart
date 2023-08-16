import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';

class ItemBannerNews extends StatelessWidget {
  const ItemBannerNews(this.url, {super.key});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Color(0xFFE0E0E0),
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
        child: switch (url) {
          null => Image.asset(ImagesApp.image3),
          _ => FadeInImage.assetNetwork(
              placeholder: ImagesApp.image2,
              image: url!,
            ),
          // Image.network(
          //     url!,
          //     fit: BoxFit.contain,
          //   ),
        });
  }
}
