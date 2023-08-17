import 'dart:math';

abstract final class ImagesApp {
  static const image1 = 'assets/images/1.webp';
  static const image2 = 'assets/images/2.webp';
  static const image3 = 'assets/images/3.webp';
  static const image4 = 'assets/images/4.webp';
  static const image5 = 'assets/images/5.webp';
  static List<String> get _list => [image1, image2, image3, image4, image5];

  static String get randomImage => _list[Random().nextInt(_list.length)];
}
