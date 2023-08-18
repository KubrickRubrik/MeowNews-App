import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
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
              ToastMassage.toast(context, context.lcz.newsUnavailableToast);
            },
            child: Image.asset(ImagesApp.image4),
          ),
          //? Message
          Container(
            margin: const EdgeInsets.only(top: 24),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF37474F),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              context.lcz.newsUnavailableMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.orangeAccent,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
