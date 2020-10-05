import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../domain/errors/errors.dart';
import '../../../domain/usecases/usecases.dart';

class HomeController extends GetxController {
  final GetWorks usecase;

  HomeController(this.usecase);
  RxList<Working> workings = <Working>[].obs;
  Failure failure;
  RxBool isInicialized = false.obs;
  RxBool isLoad = false.obs;

  TextEditingController hora = TextEditingController();
  TextEditingController minuto = TextEditingController();
  TextEditingController segundo = TextEditingController();
  TextEditingController descricao = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Future<void> onInit() async {
    await initializeFlutterFire();
    super.onInit();
    getWorks();
  }

  Future<void> getWorks() async {
    isLoad.value = true;
    final result = await usecase.getWorks();
    result.fold(
      (l) {
        failure = l;
        isLoad.value = false;
        update();
      },
      (r) {
        workings.value = r;
        isLoad.value = false;
      },
    );
  }

  Future<void> initializeFlutterFire() async {
    try {
      await Firebase.initializeApp();
      isInicialized.value = true;
    } catch (e) {
      isInicialized.value = false;
    }
  }

  Future<void> deleteWork(String id) async {
    final result = await usecase.deleteWork(id);
    result.fold(
      (l) => Get.snackbar('Error', 'Error inesperado!'),
      (r) => Get.snackbar('Pronto', 'Dados excluidos com sucesso!'),
    );
    getWorks();
  }
}
