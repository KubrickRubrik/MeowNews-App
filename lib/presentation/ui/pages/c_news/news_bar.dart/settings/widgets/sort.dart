import 'package:flutter/material.dart';

class NewsSortSettings extends StatefulWidget {
  const NewsSortSettings({super.key});

  @override
  State<NewsSortSettings> createState() => _NewsSortSettingsState();
}

class _NewsSortSettingsState extends State<NewsSortSettings> {
  bool isOpen = false;
  bool isDispaly = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isOpen = true;
      setState(() {});
      Future.delayed(const Duration(milliseconds: 300), () {
        isDispaly = true;
        setState(() {});
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      height: isOpen ? 200 : 0,
      child: AnimatedOpacity(
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
      ),
    );
  }
}
