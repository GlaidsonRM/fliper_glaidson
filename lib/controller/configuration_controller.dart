import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fliper_glaidson/service/configuration_service.dart';

class ConfigurationController extends GetxController {
  var isLoading = false.obs;
  var timeUpdate = 1.obs;
  var themeDark = false.obs;

  @override
  void onInit() {
    _getTheme();

    _getTimeUpdate();

    super.onInit();
  }

  _getTheme() {
    themeDark.value = ConfigurationService.isDarkMode();
    _changeTheme();
  }

  _changeTheme() {
    if(themeDark.value){
      Get.changeTheme(ThemeData.dark());
    }
    else {
      Get.changeTheme(ThemeData.light());
    }
  }

  updateTheme() {
    _changeTheme();
    ConfigurationService.setTheme(themeDark.value);
  }

  _getTimeUpdate() async {
    timeUpdate.value = await ConfigurationService.getTimeUpdate();
  }

  setTimeUpdate(int value) {
    timeUpdate.value = value;
    ConfigurationService.setTimeUpdate(value);
  }
}