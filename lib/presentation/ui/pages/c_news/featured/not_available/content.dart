import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/components/toast.dart';

class NotAvailableFeaturedContent extends StatelessWidget {
  const NotAvailableFeaturedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        //? Image
        InkWell(
          onTap: () {
            ToastMassage.toast(context, context.lcz.viewNewsUnavailableToast);
          },
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.white),
            child: Image.asset(
              ImagesApp.image2,
            ),
          ),
        ),
        //? Message
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.only(left: 4, bottom: 4),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade800,
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
        ),
      ],
    );
  }
}
