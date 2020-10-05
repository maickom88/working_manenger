import 'package:flutter/material.dart';

import 'components.dart';

class Btn extends StatelessWidget {
  final Color color;
  final String title;
  final Function onTap;

  const Btn({Key key, this.color, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      padding: EdgeInsets.all(15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onTap,
      child: TextCardWidgets(
        color: Colors.white,
        text: title,
        size: 14,
      ),
    );
  }
}
