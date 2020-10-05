import 'package:flutter/material.dart';
import 'package:works_manenger/core/components/text_card_widget.dart';

class CardDetails extends StatelessWidget {
  final String text;
  final String status;
  final String obs;
  final bool isWork;
  const CardDetails(
      {Key key, this.text, this.status, this.isWork = false, this.obs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: !isWork ? Colors.grey[800] : Colors.grey[600],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.5),
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ]),
      child: Visibility(
        replacement: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCardWidgets(
                  color: Colors.white,
                  text: text,
                  size: 18,
                ),
                TextCardWidgets(
                  color: status == 'Trabalhando'
                      ? Colors.green[300]
                      : status == 'Pausado' ? Colors.yellow : Colors.red[200],
                  text: status,
                  size: 18,
                ),
              ],
            ),
            Visibility(
              visible: obs?.isNotEmpty == true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCardWidgets(
                    color: Colors.white.withOpacity(0.6),
                    text: 'Observações:',
                    size: 15,
                  ),
                  SizedBox(height: 5),
                  TextCardWidgets(
                    color: Colors.white,
                    text: obs,
                    size: 16,
                  ),
                ],
              ),
            )
          ],
        ),
        visible: !isWork,
        child: TextCardWidgets(
          color: Colors.white,
          text: text,
          size: 20,
          centerText: true,
        ),
      ),
    );
  }
}
