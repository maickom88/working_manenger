import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:works_manenger/core/components/btn.dart';
import 'package:works_manenger/core/components/components.dart';
import 'package:works_manenger/presentation/pages/work/work_contorller.dart';

import 'widgets/paused_widgets.dart';
import 'widgets/time_card.dart';

class WorkPage extends GetView<WorkController> {
  @override
  Widget build(BuildContext context) {
    final taskWork = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.brown),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.defaultDialog(
                title: 'Deseja cancelar?',
                confirmTextColor: Colors.white,
                textCancel: 'Sim desejo sair',
                textConfirm: 'Não, continuar',
                middleText:
                    'Se você cancelar os dados desse trabalho não serão salvos',
                buttonColor: Colors.brown,
                cancelTextColor: Colors.brown,
                onCancel: () => Get.back(result: null),
                onConfirm: () => Get.back(),
              );
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderComponent(
                  text:
                      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}'),
              TextCardWidgets(
                color: Colors.brown.withOpacity(0.8),
                text: '${taskWork["h"]}:${taskWork["m"]}:${taskWork["s"]}',
                size: 20,
              ),
              SizedBox(height: 20),
              Center(
                child: Obx(
                  () => TextCardWidgets(
                    text: !controller.stopIsPressed.value
                        ? 'Trabalhando'
                        : 'Trabalho pausado...',
                    size: 20,
                    color: !controller.stopIsPressed.value
                        ? Color(0xffF5B982)
                        : Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => TimeCardWidget(
                        text: controller.h.value,
                        color: !controller.stopIsPressed.value
                            ? Color(0xffF5B982)
                            : Colors.grey,
                      ),
                    ),
                    Obx(
                      () => TimeCardWidget(
                        text: controller.m.value,
                        color: !controller.stopIsPressed.value
                            ? Color(0xffF5B982)
                            : Colors.grey,
                      ),
                    ),
                    Obx(
                      () => TimeCardWidget(
                        text: controller.s.value,
                        color: !controller.stopIsPressed.value
                            ? Color(0xffF5B982)
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => PausedWidgets(
                  h: controller.hPaused.value,
                  m: controller.mPaused.value,
                  s: controller.sPaused.value,
                ),
              ),
              Flexible(
                child: Obx(
                  () => Visibility(
                    visible: controller.saveListMap.length > 0,
                    child: Obx(
                      () => ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: controller.saveListMap.length,
                        itemBuilder: (context, index) {
                          var pausedListSaved = controller.saveListMap[index];
                          var timer = pausedListSaved["hoursPaused"].split(':');
                          if (!pausedListSaved["isWork"]) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              child: PausedWidgets(
                                h: timer[0] ?? '',
                                m: timer[1] ?? '',
                                s: timer[2] ?? '',
                                isNote: false,
                                obs: pausedListSaved["observation"],
                              ),
                            );
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Obx(
            () => FloatingActionButton(
              onPressed: controller.stopIsPressed.value
                  ? controller.startSwatch
                  : controller.stopTimer,
              backgroundColor: Colors.brown,
              child: controller.stopIsPressed.value
                  ? Icon(Icons.play_arrow)
                  : Icon(Icons.pause),
            ),
          ),
          SizedBox(height: 10),
          Btn(
            color: Colors.brown,
            title: 'Finalizar trabalho',
            onTap: () => controller.save(taskWork),
          )
        ],
      ),
    );
  }
}
