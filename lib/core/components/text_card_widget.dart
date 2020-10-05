import 'package:flutter/material.dart';

class TextCardWidgets extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final bool centerText;

  const TextCardWidgets(
      {Key key, this.text, this.size, this.color, this.centerText = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: centerText ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: size,
      ),
    );
  }
}
