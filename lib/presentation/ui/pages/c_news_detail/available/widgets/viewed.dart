import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news_item/provider.dart';
import 'package:provider/provider.dart';

class IsViewedItemNews extends StatelessWidget {
  const IsViewedItemNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ItemNewsProvider, bool>(
      selector: (_, Model) => Model.pageData.itemNews.viewed,
      builder: (_, viewed, child) {
        return switch (viewed) {
          false => const SizedBox.shrink(),
          true => child!,
        };
      },
      child: const _ViewedMessage(),
    );
  }
}

class _ViewedMessage extends StatefulWidget {
  const _ViewedMessage({super.key});

  @override
  State<_ViewedMessage> createState() => _ViewedMessageState();
}

class _ViewedMessageState extends State<_ViewedMessage> {
  bool isView = false;
  @override
  void initState() {
    _showAndhideMessageViewedNews(1);
    _showAndhideMessageViewedNews(5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.ease,
      height: isView ? 48 : 0,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 17, 22, 49),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 2,
            spreadRadius: -1,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Text(
        "Вы уже читали эту новость",
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  void _showAndhideMessageViewedNews(int seconds) {
    Future.delayed(Duration(seconds: seconds), () {
      if (mounted) {
        isView = !isView;
        setState(() {});
      }
    });
  }
}
