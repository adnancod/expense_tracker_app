import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../view_model/controller/income_controller/income_controller.dart';

class EditExpense extends StatelessWidget {
  final TextEditingController expense;
  final TextEditingController category;
  final VoidCallback onSave;
  EditExpense({super.key, required this.expense, required this.category, required this.onSave});

  final controller = Get.find<AddIncomeController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Edit Expense'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: expense,
            decoration: InputDecoration(
              labelText: 'New Expense',
            ),
          ),
          TextFormField(
            controller: category,
            decoration: InputDecoration(
              labelText: 'New Category',
            ),
          ),
    ]
    ),
    actions: [
      TextButton(onPressed: (){
        Navigator.pop(context);
      }, child: Text('Cancel')),
      TextButton(onPressed: (){
        onSave();
        Navigator.pop(context);
      }, child: Text('Save')),
    ],);
  }
}
