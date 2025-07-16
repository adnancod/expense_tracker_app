import 'package:expense_tracker_app/utils/color_gradient.dart';
import 'package:expense_tracker_app/view/main_screen/add_expense/add_expense.dart';
import 'package:expense_tracker_app/view/main_screen/add_expense/add_income.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ModalSheet extends StatelessWidget {
  const ModalSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: ColorGradient.colorGradient(context),
        borderRadius: BorderRadius.circular(20)
      ),
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Add Entry",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Get.to(() => AddIncome());
            },
            icon: Icon(Icons.arrow_downward, color: Colors.green),
            label: Text("Add Income"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green.shade100,
              foregroundColor: Colors.green.shade900,
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
          ),

          SizedBox(height: 12),

          ElevatedButton.icon(
            onPressed: () {
              Navigator.pop(context);
              Get.to(() => AddExpense());
            },
            icon: Icon(Icons.arrow_upward, color: Colors.red),
            label: Text("Add Expense"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade100,
              foregroundColor: Colors.red.shade900,
              padding: EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ],
      ),
    );
  }
}
