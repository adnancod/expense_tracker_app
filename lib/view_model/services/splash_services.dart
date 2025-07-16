import 'package:expense_tracker_app/view/biometric/biometric_screen.dart';
import 'package:expense_tracker_app/view/home_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/switch/switch_controller.dart';

class SplashServices{

  final switchController = Get.find<SwitchController>();
  Future<void> initialize()async{
    await Future.delayed(Duration(seconds: 2),(){
      if(!switchController.isSwitched.value){
        return Get.off(HomeScreen());
      }
      Get.off(BiometricScreen());
    });
  }
}