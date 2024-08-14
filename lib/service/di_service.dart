
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:patterns_getx/controller/main_controller.dart';
import 'package:patterns_getx/controller/splash_controller.dart';
import 'package:patterns_getx/controller/starter_controller.dart';

import '../controller/Starter_create_controller.dart';

class DIService{
  static Future<void> init()async{
    // Get.put<MainController>(MainController());   // boshida o'qib oladi
    Get.lazyPut<MainController>(() => MainController(), fenix: true);  // kerak bolganda o'qiydi
    // Get.lazyPut<CreateController>(() => CreateController(), fenix: true);  // kerak bolganda o'qiydi
     Get.lazyPut<SplashController>(() => SplashController(), fenix: true);  // kerak bolganda o'qiydi
     Get.lazyPut<StarterController>(() => StarterController(), fenix: true);  // kerak bolganda o'qiydi
     Get.lazyPut<StarterCreateController>(() => StarterCreateController(), fenix: true);  // kerak bolganda o'qiydi
  }
}