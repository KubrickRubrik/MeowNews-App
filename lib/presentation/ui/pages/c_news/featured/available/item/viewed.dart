import 'package:flutter/material.dart';

class ViewedFeaturedNews extends StatelessWidget {
  const ViewedFeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 4, top: 4),
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(14)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000),
            offset: Offset(-0.5, -1.5),
          ),
          BoxShadow(
            color: Color(0xFFffffff),
            offset: Offset(0, 0),
            spreadRadius: 0.2,
            blurRadius: 0,
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Icon(
        Icons.remove_red_eye,
        color: Color(0xFF00A505),
        size: 20,
      ),
    );
  }
}
