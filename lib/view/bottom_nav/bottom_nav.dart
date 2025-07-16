import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/controller/nav_controller/nav_controller.dart';

class BottomNav extends StatelessWidget {

  final navController = Get.find<NavController>();

  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
            backgroundColor: Theme
                .of(context)
                .colorScheme
                .onPrimary,
            onTap: navController.changeIndex,
            currentIndex: navController.selectedIndex.value,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.auto_graph),
                  label: 'Stats'
              ),
            ]),
      );
    });
  }
}
