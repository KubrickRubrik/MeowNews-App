import 'package:flutter/material.dart';
import 'package:news_test/presentation/ui/components/toast.dart';

class ButtonettingViewedNews extends StatelessWidget {
  const ButtonettingViewedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            ToastMassage.toast(context, "The news is all marked as viewed");
          },
          child: const Icon(
            Icons.done_all_outlined,
          ),
        ),
      ),
    );
  }
}
