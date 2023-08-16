import 'package:flutter/material.dart';

class NotAvailableFeaturedContent extends StatelessWidget {
  const NotAvailableFeaturedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Text(
          "News view is not available\r\nat the moment",
          style: TextStyle(
            color: Colors.orangeAccent,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
