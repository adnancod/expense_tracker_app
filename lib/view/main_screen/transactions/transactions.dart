import 'package:expense_tracker_app/view/main_screen/transactions/expense_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../view_model/controller/income_controller/income_controller.dart';

class Transactions extends StatelessWidget {
  Transactions({super.key});

  final controller = Get.find<AddIncomeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if(controller.expenses.isEmpty){
        return Expanded(child: Center(child: Text('No Expense Added')));
      }
      return Expanded(
        child: ListView.builder(
            itemCount: controller.expenses.length,
            itemBuilder: (context, index) {
              final expense = controller.expenses[index];
              return ExpenseCard(expense: expense);
            }),
      );
    });
  }
}
