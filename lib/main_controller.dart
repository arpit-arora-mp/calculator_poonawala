

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainController extends GetxController {
  RxString calcText = "".obs;

  void setText(String text ){
    calcText.value = text+calcText.value;
    update();

  }
}
