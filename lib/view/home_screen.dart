import 'package:expense_tracker_app/consts/gradient_fab.dart';
import 'package:expense_tracker_app/view/main_screen/add_expense/add_expense.dart';
import 'package:expense_tracker_app/view/main_screen/main_screen.dart';
import 'package:expense_tracker_app/view/stats_screen/stats_screen.dart';
import 'package:expense_tracker_app/view_model/controller/nav_controller/nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_nav/bottom_nav.dart';
import 'main_screen/add_expense/modalSheet.dart';

class HomeScreen extends StatelessWidget {

  final navController = Get.put(NavController(), permanent: true);

  HomeScreen({super.key});

  final List<Widget> pages = [
    MainScreen(),
    StatsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> pages[navController.selectedIndex.value] ),
      bottomNavigationBar: BottomNav(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GradientFAB(onPressed: (){
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            isScrollControlled: true,
            builder: (context){
              return ModalSheet();
            });
      }),
    );
  }
}
