import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';

abstract final class ToastMassage {
  static void toast(BuildContext context, String title, {TypeMassage code = TypeMassage.massage, int duration = 2}) {
    // Settings
    final ({Color colorBackground, Color colorText}) data = switch (code) {
      TypeMassage.error => (colorBackground: const Color(0xFFDC0037), colorText: const Color(0xFFFFFFFF)),
      TypeMassage.warning => (colorBackground: const Color(0xFFFF9800), colorText: const Color(0xFF000000)),
      _ => (colorBackground: const Color(0xFF2A363C), colorText: const Color(0xFFFFFFFF)),
    };
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    // Widget
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: duration),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          decoration: BoxDecoration(
            color: data.colorBackground,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                spreadRadius: -4,
              )
            ],
          ),
          clipBehavior: Clip.hardEdge,
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: data.colorText,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
