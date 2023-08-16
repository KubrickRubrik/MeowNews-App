import 'package:flutter/material.dart';

class ItemDescriptionNews extends StatelessWidget {
  const ItemDescriptionNews(this.description, {super.key});
  final String? description;
  @override
  Widget build(BuildContext context) {
    return switch (description) {
      null => const SizedBox.shrink(),
      _ => Text(
          description!,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
    };
  }
}
