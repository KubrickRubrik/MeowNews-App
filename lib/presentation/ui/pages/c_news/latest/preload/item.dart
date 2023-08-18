import 'package:flutter/material.dart';

class ItemPreloadedLatestNews extends StatelessWidget {
  const ItemPreloadedLatestNews({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        constraints: const BoxConstraints(maxWidth: 600),
        child: AspectRatio(
          aspectRatio: 1.5,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(offset: Offset(0, 1), blurRadius: 2, spreadRadius: -1),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
