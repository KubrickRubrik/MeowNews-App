import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:provider/provider.dart';

class SectionSearchWord extends StatefulWidget {
  const SectionSearchWord({super.key});

  @override
  State<SectionSearchWord> createState() => _SectionSearchWordState();
}

class _SectionSearchWordState extends State<SectionSearchWord> {
  bool isFocus = false;
  final myFocusNode = FocusNode();

  void _scrollListener() {
    if (mounted) {
      isFocus = myFocusNode.hasFocus;
      setState(() {});
    }
  }

  @override
  void initState() {
    myFocusNode.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      height: 36,
      width: isFocus ? MediaQuery.of(context).size.width / 3 : 80,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(-0.5, -1.0),
          ),
          BoxShadow(
            color: Color(0xFFffffff),
            offset: Offset(0, 0),
            spreadRadius: 0.2,
            blurRadius: 0,
          ),
        ],
      ),
      alignment: Alignment.bottomCenter,
      child: TextField(
        focusNode: myFocusNode,
        maxLength: 24,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.blueGrey.shade800,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        textInputAction: TextInputAction.search,
        onChanged: (value) {
          context.read<NewsProvider>().pageData.newsSearchBar.setSearchWord(value);
        },
        onSubmitted: (value) {
          context.read<NewsProvider>().searchLatestNews();
        },
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          counter: const SizedBox.shrink(),
          hintText: "IT",
          hintStyle: TextStyle(
            color: Colors.blueGrey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          contentPadding: const EdgeInsets.only(left: 6, right: 6, bottom: 4),
        ),
        showCursor: false,
      ),
    );
  }
}
