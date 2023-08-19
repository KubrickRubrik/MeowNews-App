import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:provider/provider.dart';

class SectionLanguage extends StatelessWidget {
  const SectionLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          context.read<NewsProvider>().setDisplayNewsBar();
        },
        child: const SizedBox(
          width: 56,
          child: Center(
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text(
                "RU",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
