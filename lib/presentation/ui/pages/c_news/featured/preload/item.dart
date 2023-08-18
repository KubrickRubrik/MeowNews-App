import 'package:flutter/material.dart';

class ItemPreloadedFeaturedNews extends StatelessWidget {
  const ItemPreloadedFeaturedNews({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 0.8,
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(offset: Offset(0, 1), blurRadius: 2, spreadRadius: -1),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Material(
          color: const Color(0xFFE0E0E0),
          borderRadius: BorderRadius.circular(16),
          child: InkWell(
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
