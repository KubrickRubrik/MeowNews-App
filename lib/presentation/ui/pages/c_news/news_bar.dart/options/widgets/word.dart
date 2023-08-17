import 'package:flutter/material.dart';

class SectionSearchWord extends StatefulWidget {
  const SectionSearchWord({super.key});

  @override
  State<SectionSearchWord> createState() => _SectionSearchWordState();
}

class _SectionSearchWordState extends State<SectionSearchWord> {
  bool isFocus = false;
  final myFocusNode = FocusNode();

  @override
  void initState() {
    myFocusNode.addListener(() {
      isFocus = myFocusNode.hasFocus;
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    myFocusNode.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
      height: 36,
      width: isFocus ? MediaQuery.of(context).size.width / 4 : 60,
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
      child: TextField(
        focusNode: myFocusNode,
        maxLength: 24,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.blueGrey.shade800,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          height: 1.2,
        ),
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          counter: const SizedBox.shrink(),
          hintText: "IT",
          hintStyle: TextStyle(
            color: Colors.blueGrey.shade700,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            height: 1.2,
          ),
          contentPadding: const EdgeInsets.only(left: 4, top: 8),
          // isCollapsed: true,
        ),
      ),
    );
  }
}
