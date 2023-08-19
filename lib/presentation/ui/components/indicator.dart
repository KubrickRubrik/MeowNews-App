import 'package:flutter/material.dart';

class ProgerssIndicator extends StatelessWidget {
  const ProgerssIndicator({super.key, this.padding = 16, this.color = 0xFFffffff});
  final double padding;
  final int color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(Color(color)),
        ),
      ),
    );
  }
}
