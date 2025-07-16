import 'package:expense_tracker_app/consts/text_lato.dart';
import 'package:expense_tracker_app/view/main_screen/balance_container/balance_container.dart';
import 'package:expense_tracker_app/view/main_screen/transactions/transactions.dart';
import 'package:expense_tracker_app/view/main_screen/transactions/view_expenses.dart';
import 'package:expense_tracker_app/view/settings/settings.dart';
import 'package:expense_tracker_app/view_model/controller/income_controller/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller= Get.put(AddIncomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLato(
                    text: 'Welcome Back!', fontWeight: FontWeight.bold,),
                  IconButton(
                      onPressed: (){
                        Get.to(Settings());
                      },
                      icon: Icon(Icons.settings))
                ],
              ),
              BalanceContainer(),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextLato(text: 'Transactions', fontWeight: FontWeight.bold,),
                  GestureDetector(
                      onTap: (){
                        Get.to(ViewExpenses());
                      },
                      child: TextLato(text: 'View All',fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.primary,))
                ],
              ),
              SizedBox(height: 15,),
              Transactions()
            ],
          ),
        ),
      ),
    );
  }
}
