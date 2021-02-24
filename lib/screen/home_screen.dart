import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:fliper_glaidson/controller/configuration_controller.dart';
import 'package:fliper_glaidson/controller/home_controller.dart';
import 'package:fliper_glaidson/screen/configuration_screen.dart';
import 'package:fliper_glaidson/utils/format_number.dart';
import 'package:fliper_glaidson/widgets/outline_button_widget.dart';
import 'package:fliper_glaidson/widgets/text_small.dart';
import 'package:fliper_glaidson/widgets/text_big.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final ConfigurationController configurationController = Get.find();
  @override
  Widget build(BuildContext context) {

    homeController.onInit();

    return Scaffold(
      appBar: AppBar(
        title: Text('Fliper - Glaidson'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Get.to(ConfigurationScreen(), transition: Transition.downToUp)),
        ],
      ),
      body: Obx(() => Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 12,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBig(
                        text: 'Seu resumo',
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value){
                          homeController.updateInfo();
                        },
                        itemBuilder: (context) {
                          return {'Atualizar'}.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(choice),
                            );
                          }).toList();
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextSmall(
                    text: 'Valor investido',
                    fontWeight: false,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  TextBig(
                      text: formatReais(
                          homeController.wealthSummary.value.total)),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSmall(
                        text: 'Rentabilidade/mês',
                      ),
                      TextBig(
                        text:
                        '${formatDouble(homeController.wealthSummary.value.profitability)}%',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSmall(
                        text: 'CDI',
                      ),
                      TextBig(
                        text:
                        '${formatDouble(homeController.wealthSummary.value.cdi)}%',
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSmall(
                        text: 'Ganho/mês',
                      ),
                      TextBig(
                        text: formatReais(
                            homeController.wealthSummary.value.gain),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlineButtonWidget((){}, 'VER MAIS'),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Obx(() => Text(
                    'Última atualização: ${homeController.lastUpdate.value}',
                    style: TextStyle(color: configurationController.themeDark.value ? Colors.white : Color(0xff3B5CB8)),
                  ))
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
