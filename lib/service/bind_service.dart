

import 'package:get/get.dart';
import 'package:patterns_getx/controller/main_controller.dart';

class BindService implements Bindings{
  @override
  void dependencies() {
    Get.put<MainController> (MainController());
  }
}