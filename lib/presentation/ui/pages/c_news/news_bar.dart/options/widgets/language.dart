import 'package:flutter/material.dart';

class SectionLanguage extends StatelessWidget {
  const SectionLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: const SizedBox(
          width: 56,
          child: Center(
            child: Text(
              "EN",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
