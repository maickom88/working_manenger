import 'package:flutter/material.dart';

import '../../../../core/components/components.dart';

class CardWidget extends StatelessWidget {
  final String data;
  final String obs;
  final bool isCard;

  const CardWidget({Key key, this.data, this.obs, this.isCard = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(0xff1E3A4F),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.6),
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ]),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isCard ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
        children: [
          TextCardWidgets(
            text: data,
            color: Colors.white,
            size: 18,
          ),
          TextCardWidgets(
            text: 'Observações',
            color: Colors.white.withOpacity(0.5),
            size: 15,
          ),
          SizedBox(height: 10),
          TextCardWidgets(
            text: obs,
            color: Colors.white,
            size: 16,
          ),
        ],
      ),
    );
  }
}
