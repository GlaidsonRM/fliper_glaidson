import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ConfigurationService {
  static final box = GetStorage();

  static bool isDarkMode () {
    String themeDark = box.read('theme');

    if(GetUtils.isNullOrBlank(themeDark)){
      return false;
    }
    else if(themeDark == 'dark'){
      return true;
    }
    else {
      return false;
    }
  }

  static setTheme(bool dark){
    box.write('theme', dark ? 'dark' : 'ligth');
  }

  static getTimeUpdate() {
    var timeUpdate = box.read('time_update');
    return timeUpdate ?? 1;
  }

  static setTimeUpdate(int minutes){
    box.write('time_update', minutes);
  }
}