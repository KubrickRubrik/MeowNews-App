import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';

class BannerFeaturedNews extends StatelessWidget {
  const BannerFeaturedNews(this.url, {super.key});
  final String? url;
  @override
  Widget build(BuildContext context) {
    return switch (url) {
      null => Image.asset(ImagesApp.image3),
      _ => FadeInImage.assetNetwork(
          placeholder: ImagesApp.randomImage,
          image: url!,
          fit: BoxFit.cover,
        ),
    };
  }
}
