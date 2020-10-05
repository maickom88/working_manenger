import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:works_manenger/core/components/btn.dart';
import 'package:works_manenger/presentation/pages/work/work.dart';

class DialogObs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController obsController = TextEditingController();
    final WorkController controller = Get.find();
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetAnimationDuration: Duration(milliseconds: 250),
      insetAnimationCurve: Curves.elasticOut,
      child: Container(
        height: Get.height * 0.26,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffF5B982),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: obsController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Digite uma descrição',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Btn(
                    color: Colors.grey,
                    title: 'Cancelar',
                    onTap: Get.back,
                  ),
                  SizedBox(width: 10),
                  Btn(
                    color: Colors.brown,
                    onTap: () {
                      controller.observation.value = obsController.text;
                      Get.back();
                    },
                    title: 'Salvar',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
