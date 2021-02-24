import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fliper_glaidson/controller/configuration_controller.dart';

class TextBig extends StatelessWidget {
  final ConfigurationController configurationController = Get.find();
  final String text;
  final double fontSize;
  final bool fontWeight;

  TextBig({this.text = 'New text', this.fontSize = 20, this.fontWeight = true});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          text,
          style: TextStyle(
              color: configurationController.themeDark.value
                  ? Colors.white
                  : Color(0xff3B5CB8),
              fontFamily: 'Segoe UI',
              fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize),
        ));
  }
}
