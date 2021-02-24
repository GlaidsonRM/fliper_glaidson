import 'package:get/get.dart';
import 'package:fliper_glaidson/model/wealth_summary.dart';
import 'package:fliper_glaidson/service/wealth_summary_service.dart';

class HomeController extends GetxController {
  var getIngInfo = false.obs;
  var lastUpdate = ''.obs;
  var wealthSummary = WealthSummary(
          gain: 0.0,
          cdi: 0.0,
          profitability: 0.0,
          hasHistory: false,
          total: 0.0)
      .obs;

  @override
  void onInit() {
    updateInfo();

    Stream.periodic(Duration(minutes: 1)).listen((event) {
      updateInfo();
    });

    super.onInit();
  }

  updateInfo() async {
    getIngInfo.value = true;
    wealthSummary.value = await WealthSummaryService.getDataWealthSummary();
    lastUpdate.value = _formatTime();
    getIngInfo.value = false;
    wealthSummary.refresh();
  }

  _formatTime({DateTime time}) {
    time = time ?? DateTime.now();

    String hour = time.hour.toString();
    String minute = time.minute.toString();
    String second = time.second.toString();

    if (time.hour < 10) {
      hour = '0${time.hour}';
    }
    if (time.minute < 10) {
      minute = '0${time.minute}';
    }
    if (time.second < 10) {
      second = '0${time.second}';
    }

    return '$hour:$minute:$second';
  }
}
