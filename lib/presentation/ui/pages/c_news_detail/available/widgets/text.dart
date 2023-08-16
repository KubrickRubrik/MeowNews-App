import 'package:flutter/material.dart';

class ItemTextNews extends StatelessWidget {
  const ItemTextNews(this.text, {super.key});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return switch (text) {
      null => const SizedBox.shrink(),
      _ => Text(
          text!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
    };
  }
}
