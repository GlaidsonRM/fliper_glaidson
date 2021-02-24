import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fliper_glaidson/controller/configuration_controller.dart';
import 'package:fliper_glaidson/widgets/outline_button_widget.dart';

class ConfigurationScreen extends StatelessWidget {

  final ConfigurationController controller = Get.find();
  final TextEditingController _timeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Obx(() => Switch(
                        value: controller.themeDark.value,
                        onChanged: (value) {
                          controller.themeDark.value = value;
                          controller.updateTheme();
                        })),
                    SizedBox(
                      width: 12,
                    ),
                    Text('Modo Escuro')
                  ],
                ),
                Divider(),
                Text('Tempo de atulizações'),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            labelText: 'Tempo de Atualizações',
                            prefixText: 'Minutos: '),
                        keyboardType: TextInputType.number,
                        controller: _timeController,
                        validator: _validateMinute,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    OutlineButtonWidget(saveTime, 'SALVAR')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _validateMinute(String value) {
    if(GetUtils.isNullOrBlank(value)){
      return 'Digite o tempo para atualização';
    }
    return null;
  }

  saveTime() {
    if(_formKey.currentState.validate()){
      controller.setTimeUpdate(int.parse(_timeController.text));

      Get.snackbar('Sucesso', 'Tempo de atualizações definido', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
