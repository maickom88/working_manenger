import 'dart:async';

import 'package:get/get.dart';

import '../../../domain/errors/errors.dart';
import '../../../domain/usecases/usecases.dart';

class WorkController extends GetxController {
  final SaveWork usecase;

  WorkController(this.usecase);
  RxMap<String, String> work = RxMap();
  Failure failure;
  RxBool isSaved = false.obs;
  RxBool startIsPressed = true.obs;
  RxBool stopIsPressed = true.obs;
  RxBool initialStart = false.obs;
  RxString h = '00'.obs;
  RxString m = '00'.obs;
  RxString s = '00'.obs;
  RxString observation = ''.obs;
  RxString hPaused = '00'.obs;
  RxString mPaused = '00'.obs;
  RxString sPaused = '00'.obs;
  RxList saveListMap = [].obs;
  Stopwatch swatch = Stopwatch();
  Stopwatch swatchPaused = Stopwatch();

  String pausedValue =
      '${DateTime.now().hour} ${DateTime.now().minute}:${DateTime.now().second}';
  RxString returnWorkValue = '00:00:00'.obs;

  final timer = const Duration(seconds: 1);

  Future<void> saveWork() async {
    final result = await usecase.saveWork(work);
    result.fold(
      (l) {
        failure = l;
        update();
      },
      (r) {
        isSaved.value = r;
      },
    );
  }

  void startTimer() {
    Timer(timer, keepRunning);
  }

  void startTimerPaused() {
    Timer(timer, keepRunningPaused);
  }

  void keepRunning() {
    if (swatch.isRunning) {
      startTimer();
    }

    h.value = swatch.elapsed.inHours.toString().padLeft(2, "0");
    m.value = (swatch.elapsed.inMinutes % 60).toString().padLeft(2, "0");
    s.value = (swatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
  }

  void keepRunningPaused() {
    if (swatchPaused.isRunning) {
      startTimerPaused();
    }
    hPaused.value = swatchPaused.elapsed.inHours.toString().padLeft(2, "0");
    mPaused.value =
        (swatchPaused.elapsed.inMinutes % 60).toString().padLeft(2, "0");

    sPaused.value =
        (swatchPaused.elapsed.inSeconds % 60).toString().padLeft(2, "0");
  }

  void startSwatch() {
    stopIsPressed.value = false;
    startIsPressed.value = false;
    if (initialStart.value) {
      createdMapPaused();
    }
    swatch.start();
    swatchPaused.stop();
    startTimer();
    initialStart.value = true;
  }

  void startSwatcPaused() {
    swatchPaused.start();
    startTimerPaused();
  }

  void stopTimer() {
    stopIsPressed.value = true;
    startSwatcPaused();
    createdMapWork();
  }

  Future<void> save(Map taskWork) async {
    createdFinalMap();
    List<Map> works = saveListMap.map((work) {
      return {
        "observation": work["observation"],
        "status": work["status"],
        "hoursWorking": work["hoursWorking"],
      };
    }).toList();

    Map<String, dynamic> forSaveWork = {
      'dataWorking':
          '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
      'hoursWorking': '${taskWork["h"]}:${taskWork["m"]}:${taskWork["s"]}',
      'description': taskWork["desc"],
      'workingDetails': works
    };
    print(forSaveWork);
    final result = await usecase.saveWork(forSaveWork);
    Get.back(result: result.fold((l) => false, (r) => true));
  }

  void createdMapWork() {
    Map pausedMap = {
      "hoursPaused": "${hPaused.value}:${mPaused.value}:${sPaused.value}",
      "hoursWorking":
          "$pausedValue - ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
      "observation": "$observation",
      "status": "Trabalhando",
      "isWork": true
    };
    print(pausedMap);
    saveListMap.add(pausedMap);
    swatchPaused.reset();
    changedPause();
  }

  void createdMapPaused() {
    Map pausedMap = {
      "hoursPaused": "${hPaused.value}:${mPaused.value}:${sPaused.value}",
      "hoursWorking":
          "$pausedValue - ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
      "observation": "$observation",
      "status": "Pausado",
      "isWork": false
    };
    print(pausedMap);
    saveListMap.add(pausedMap);
    observation.value = '';
    changedPause();
  }

  void createdFinalMap() {
    Map finalMap = {
      "hoursPaused": "${hPaused.value}:${mPaused.value}:${sPaused.value}",
      "hoursWorking":
          "$pausedValue - ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
      "observation": "$observation",
      "status": "Finalizado",
      "isWork": false
    };
    saveListMap.add(finalMap);
    observation.value = '';
    changedPause();
  }

  void changedPause() {
    pausedValue =
        "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
  }
}
