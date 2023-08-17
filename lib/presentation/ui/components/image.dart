import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';
import 'package:collection/collection.dart';

class ComponentImage extends StatelessWidget {
  const ComponentImage(this.url, {super.key, this.asset = ImagesApp.image3});
  final String? url;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return switch (_checkImage(url)) {
      false => Image.asset(asset),
      true => FadeInImage.assetNetwork(
          placeholder: ImagesApp.randomImage,
          image: url!,
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            print("1 $error = $url");
            return Image.asset(asset);
          },
          placeholderErrorBuilder: (context, error, stackTrace) {
            print("2 $error = $url");
            return Image.asset(asset);
          },
        ),
    };
  }

  bool _checkImage(String? url) {
    if (url == null || url.isEmpty) return false;
    final result = goodImageExtension.firstWhereOrNull((imageExt) => url.endsWith(imageExt));
    return result != null;
  }

  List<String> get goodImageExtension => ['.webp', '.jpg', '.png', '.gif', '.jpeg', '.tiff', '.bmp'];
}
