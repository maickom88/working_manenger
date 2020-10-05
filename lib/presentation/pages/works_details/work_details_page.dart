import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../core/components/components.dart';

class WorkDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Working work = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.brown),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderComponent(text: 'Historico'),
            TextCardWidgets(
              color: Colors.brown.withOpacity(0.8),
              text: 'Detalhes: ${work.dataWorking}',
              size: 20,
            ),
            SizedBox(height: 20),
            CardDetails(
              text: 'Definido horário de trabalho de:\n ${work.hoursWorking}',
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: work.workingDetails.length,
                itemBuilder: (context, index) {
                  var workDetails = work.workingDetails[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CardDetails(
                      text: workDetails.hoursWorking,
                      status: workDetails.status,
                      obs: workDetails.observation,
                      isWork: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
