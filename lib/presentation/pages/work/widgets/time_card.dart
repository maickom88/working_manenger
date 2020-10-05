import 'package:flutter/material.dart';

class TimeCardWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool isPaused;

  const TimeCardWidget({Key key, this.text, this.color, this.isPaused = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: !isPaused ? 93 : 80,
      height: !isPaused ? 80 : 70,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
