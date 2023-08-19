import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:provider/provider.dart';

class NewsLanguageSettings extends StatelessWidget {
  const NewsLanguageSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.media.size.height / (4 * 3) - 6;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: _prepareOptions(size),
      ),
    );
  }

  List<Widget> _prepareOptions(double size) {
    return AvailableNewsLanguages.values.map((e) {
      return _ItemOption(e, size: size);
    }).toList();
  }
}

class _ItemOption extends StatelessWidget {
  const _ItemOption(this.option, {required this.size});
  final AvailableNewsLanguages option;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NewsProvider>().setLanguageOptions(option);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: (option == context.read<NewsProvider>().pageData.newsSearchBar.options.languageOptions) ? const Color(0xFFD6E7FF) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        alignment: Alignment.center,
        child: Text(
          option.name.toUpperCase(),
          style: const TextStyle(
            color: Color(0xFF124C9C),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
