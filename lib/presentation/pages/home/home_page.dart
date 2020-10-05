import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/components/components.dart';
import 'home.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderComponent(text: 'Historico'),
            Obx(
              () => Visibility(
                visible: controller.workings.isNotEmpty,
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.grey, height: 2),
                    children: [
                      TextSpan(
                        text: 'Arraste para os lados para remover',
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => Visibility(
                  replacement: Visibility(
                    replacement: CardWidget(
                      data: 'Atenção',
                      isCard: true,
                      obs: 'Você não possui registros\nComece um agora...',
                    ),
                    visible: controller.isLoad.value,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  visible: controller.workings.isNotEmpty,
                  child: ListView.builder(
                    itemCount: controller.workings.length,
                    itemBuilder: (context, index) {
                      var work = controller.workings[index];
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (_) async {
                          await Get.defaultDialog(
                            title: 'Deseja Excluir?',
                            confirmTextColor: Colors.white,
                            textCancel: 'Não!',
                            textConfirm: 'Sim desejo Excluir',
                            middleText:
                                'Você excluirá permanentemente esses dados',
                            buttonColor: Colors.brown,
                            cancelTextColor: Colors.brown,
                            onCancel: () {
                              Navigator.pop(context, false);
                            },
                            onConfirm: () async {
                              Navigator.pop(context, true);
                              await controller.deleteWork(work.id);
                            },
                          );
                          await controller.getWorks();
                        },
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed('/work-datails', arguments: work);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10, bottom: 10),
                            child: CardWidget(
                              data: work.dataWorking,
                              obs: work.description,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(DialogCreatedWork());
        },
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
      ),
    );
  }
}
