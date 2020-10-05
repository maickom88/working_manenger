import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String text;

  const HeaderComponent({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.headline2.copyWith(color: Colors.brown),
    );
  }
}
