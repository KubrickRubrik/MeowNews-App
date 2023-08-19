import 'package:flutter/material.dart';

class NewsLanguageSettings extends StatefulWidget {
  const NewsLanguageSettings({super.key});

  @override
  State<NewsLanguageSettings> createState() => _NewsLanguageSettingsState();
}

class _NewsLanguageSettingsState extends State<NewsLanguageSettings> {
  bool isOpen = false;
  bool isDispaly = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (mounted) {
          isDispaly = true;
          setState(() {});
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      opacity: isDispaly ? 1 : 0,
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade800,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "In progress...",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
