import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/a_start/start.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.setup();
  await locator<NewsProvider>().getInitNews();
  runApp(const StartPage());
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const StartPage(),
    ),
  );
}
