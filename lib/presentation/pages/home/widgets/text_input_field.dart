import 'package:flutter/material.dart';

class TextInputFieldWidget extends StatelessWidget {
  final String text;
  final TextEditingController controller;

  const TextInputFieldWidget({Key key, this.controller, this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 93,
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffF5B982),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: (value) {
          if (value.isEmpty) {
            return "Preencha";
          }
          if (value.length < 2) {
            return "0$value";
          }
          if (text == 'Horas') {
            if (int.parse(value) > 24) {
              return "24";
            }
          }
          if (text == 'Minutos' || text == "Segundos") {
            if (int.parse(value) > 60) {
              return "60";
            }
          }
          return null;
        },
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 2,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintText: text,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
