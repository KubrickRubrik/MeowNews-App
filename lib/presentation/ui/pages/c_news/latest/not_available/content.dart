import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';
import 'package:news_test/presentation/ui/components/toast.dart';

class NotAvailableLatestContent extends StatelessWidget {
  const NotAvailableLatestContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          //? Image
          InkWell(
            onTap: () {
              ToastMassage.toast(context, "News unavailable?\r\nTry running a search.");
            },
            child: Image.asset(ImagesApp.image4),
          ),
          //? Message
          // Container(
          //   margin: const EdgeInsets.only(top: 24),
          //   padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          //   decoration: BoxDecoration(
          //     color: const Color(0xFF37474F),
          //     borderRadius: BorderRadius.circular(16),
          //   ),
          //   child: const Text(
          //     "News view is not available\r\nat the moment",
          //     textAlign: TextAlign.center,
          //     style: TextStyle(
          //       color: Colors.orangeAccent,
          //       fontSize: 18,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
