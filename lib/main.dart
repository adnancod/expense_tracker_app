import 'package:expense_tracker_app/consts/theme.dart';
import 'package:expense_tracker_app/model/expense_model/expense_model.dart';
import 'package:expense_tracker_app/view/splash/splash_screen.dart';
import 'package:expense_tracker_app/view_model/controller/switch/switch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ExpenseModelAdapter());
  await Hive.openBox<ExpenseModel>('expense');

  Hive.registerAdapter(IncomeModelAdapter());
  await Hive.openBox<IncomeModel>('income');

  Get.put(SwitchController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final switchController = Get.find<SwitchController>();
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: MyTheme().lightColorScheme,
        darkTheme: MyTheme().darkColorScheme,
        themeMode: switchController.isThemeSwitched.value
            ? ThemeMode.dark
            : ThemeMode.light,
        home: SplashScreen(),
      );
    });
  }
}
