import 'package:flutter/material.dart';

class SectionSortBy extends StatelessWidget {
  const SectionSortBy({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: const Center(
          child: Text(
            "Relevancy",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
