import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:works_manenger/core/components/btn.dart';
import 'package:works_manenger/core/components/text_card_widget.dart';
import 'package:works_manenger/presentation/pages/home/home_controller.dart';
import 'package:works_manenger/presentation/pages/home/widgets/text_input_field.dart';

class DialogCreatedWork extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Dialog(
      insetPadding: EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      insetAnimationDuration: Duration(milliseconds: 250),
      insetAnimationCurve: Curves.elasticOut,
      child: Container(
        height: 360,
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextCardWidgets(
                text: 'Preencha o horário a trabalhar',
                size: 25,
                color: Color(0xff1E3A4F),
              ),
              SizedBox(height: 10),
              Form(
                key: homeController.key,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextInputFieldWidget(
                      text: 'Horas',
                      controller: homeController.hora,
                    ),
                    TextInputFieldWidget(
                      text: 'Minutos',
                      controller: homeController.minuto,
                    ),
                    TextInputFieldWidget(
                      text: 'Segundos',
                      controller: homeController.segundo,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: 80,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xffF5B982),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextFormField(
                  controller: homeController.descricao,
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
              TextCardWidgets(
                text: 'Opcional',
                size: 14,
                color: Colors.grey,
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
                    onTap: () async {
                      if (homeController.key.currentState.validate()) {
                        print(homeController.hora.text);
                        Map map = {
                          "h": homeController.hora?.text,
                          "m": homeController.minuto?.text,
                          "s": homeController.segundo?.text,
                          "desc": homeController.descricao?.text,
                        };
                        final result =
                            await Get.toNamed('/work', arguments: map);
                        Get.back();
                        if (result == null) {
                          Get.back();
                        }
                        if (result != null && result == true) {
                          homeController.getWorks();
                          Get.back();
                        } else {
                          Get.back();
                          Get.snackbar("Ops", 'Error ao salvar');
                        }
                      }
                    },
                    title: 'Iniciar',
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
