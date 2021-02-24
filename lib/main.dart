import 'package:fliper_glaidson/controller/configuration_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'screen/home_screen.dart';

void main() async {
  await GetStorage.init();

  Get.lazyPut(() => ConfigurationController());
  ConfigurationController configurationController = Get.find();
  configurationController.onInit();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fliper Glaidson',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3B5CB8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
