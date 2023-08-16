import 'package:flutter/material.dart';

class NotAvailableLatestContent extends StatelessWidget {
  const NotAvailableLatestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: const EdgeInsets.only(top: 24),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF37474F),
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
