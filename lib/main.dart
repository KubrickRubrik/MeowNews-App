import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/ui/pages/a_start/start.dart';
import 'package:device_preview/device_preview.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator.setup();
  // runApp(const StartPage());
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const StartPage(),
    ),
  );
}
