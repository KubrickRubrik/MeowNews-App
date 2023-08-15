import 'package:flutter/material.dart';

class DetailNewsItemPage extends StatelessWidget {
  const DetailNewsItemPage(this.data, {super.key});
  final Object? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
