import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:news_test/core/config/image.dart';

//! Unfortunately, the news api used does not always provide
//! correct image data (status 403, 404).
// Therefore, the http package is used to download:
// - 1. The status is being checked;
// - 2. A list of 8-bit integers is formed `imageBytes`;
// - 3. If data is available, the image is displayed
//      from memory `MemoryImage(imageBytes!).
//! Some image sources are blocked, so the list of bad sources
//! is used to check if the request is possible [listBasSource].
//
// If this preparation is not used, a _ClientSocketException
// (OS Error: Connection reset by peer, errno = 104) exception
// occurs, which cannot be handled in try-catch
class ComponentImage extends StatefulWidget {
  const ComponentImage(this.url, {super.key, this.asset = ImagesApp.image3});
  final String? url;
  final String asset;

  @override
  State<ComponentImage> createState() => _ComponentImageState();
}

class _ComponentImageState extends State<ComponentImage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Uint8List? imageBytes;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    try {
      _prepareImageView();
    } catch (e) {
      print("OS ERROR problem when displaying an image");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return switch (imageBytes) {
      null => Image.asset(widget.asset),
      _ => FadeInImage(
          placeholder: AssetImage(widget.asset),
          image: MemoryImage(imageBytes!),
          fit: BoxFit.cover,
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(widget.asset);
          },
        ),
    };
  }

  // Checking the ability to view the image.
  _prepareImageView() {
    if (widget.url == null) return;
    if (!_isCorrectImage(widget.url)) {
      return;
    }
    final uri = Uri.parse(widget.url!);
    if (mounted) {
      http.get(uri).then((response) {
        if (mounted) {
          if (response.statusCode == 200 && response.headers["content-type"] is String && response.headers["content-type"]!.contains("image")) {
            imageBytes = response.bodyBytes;
            setState(() {});
          }
        }
      });
    }
  }

  // Checking for prohibited sources.
  bool _isCorrectImage(String? url) {
    if (url == null || url.isEmpty) return false;
    for (final badSourse in listBadSource) {
      if (url.contains(badSourse)) {
        return false;
      }
    }
    return true;
  }

  List<String> get listBadSource => [
        'gdb.voanews.com',
        'ichef.bbci.co.uk',
        'meduza.io',
      ];
}
