import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SwitchController extends GetxController{
  RxBool isSwitched = false.obs;
  RxBool isThemeSwitched = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSwitchState();
    loadTheme();
  }

  Future<void> toggleSwitch(bool value)async{
    isSwitched.value = value;

    SharedPreferences sp =await SharedPreferences.getInstance();
    await sp.setBool('isSwitched', value);
  }

  Future<void> loadSwitchState()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    isSwitched.value = sp.getBool('isSwitched') ?? false;

  }

  Future<void> toggleTheme(bool value)async{
    isThemeSwitched.value = value;

    SharedPreferences sp =await SharedPreferences.getInstance();
    await sp.setBool('isThemeSwitched', value);
  }

  Future<void> loadTheme()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    isThemeSwitched.value = sp.getBool('isThemeSwitched') ?? false;

  }

}