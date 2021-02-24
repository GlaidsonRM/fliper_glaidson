import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fliper_glaidson/controller/configuration_controller.dart';

class OutlineButtonWidget extends StatelessWidget {
  final ConfigurationController configurationController = Get.find();
  final Function onPressed;
  final String text;

  OutlineButtonWidget(this.onPressed, this.text);

  @override
  Widget build(BuildContext context) {
    return Obx(() => OutlineButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: configurationController.themeDark.value ? Colors.greenAccent : Color(0xff3B5CB8),
        ),
      ),
      color: Color(0xff3B5CB8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      borderSide: BorderSide(
        width: 2,
        color: configurationController.themeDark.value ? Colors.greenAccent : Color(0xff3B5CB8),
      ),
    ));
  }
}
