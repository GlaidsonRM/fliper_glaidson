import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fliper_glaidson/controller/configuration_controller.dart';

class TextSmall extends StatelessWidget {
  final ConfigurationController configurationController = Get.find();
  final String text;
  final double fontSize;
  final bool fontWeight;

  TextSmall(
      {this.text = 'New text', this.fontSize = 14, this.fontWeight = true});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text(
          text,
          style: TextStyle(
              color: configurationController.themeDark.value
                  ? Colors.greenAccent
                  : Color(0xff5B5F71),
              fontFamily: 'Segoe UI',
              fontWeight: fontWeight ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize),
        ));
  }
}
