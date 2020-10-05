import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:works_manenger/core/bindings/home_bindings.dart';
import 'package:works_manenger/core/bindings/work_bindings.dart';
import 'package:works_manenger/presentation/pages/home/home_page.dart';
import 'package:works_manenger/presentation/pages/work/work_page.dart';
import 'package:works_manenger/presentation/pages/works_details/work_details_page.dart';

void main() {
  runApp(GetMaterialApp(
    onInit: () async => await Firebase.initializeApp(),
    debugShowCheckedModeBanner: false,
    initialRoute: '/home',
    getPages: [
      GetPage(
        name: '/home',
        binding: HomeBindings(),
        page: () => HomePage(),
      ),
      GetPage(
        name: '/work-datails',
        page: () => WorkDetails(),
      ),
      GetPage(
        name: '/work',
        binding: WorkBindings(),
        page: () => WorkPage(),
      )
    ],
  ));
}
