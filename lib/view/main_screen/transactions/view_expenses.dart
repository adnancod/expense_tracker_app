import 'package:expense_tracker_app/view/main_screen/transactions/edit_expense.dart';
import 'package:expense_tracker_app/view/main_screen/transactions/transactions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import '../../../utils/color_gradient.dart';
import '../../../view_model/controller/income_controller/income_controller.dart';
import 'expense_card.dart';

class ViewExpenses extends StatelessWidget {
  ViewExpenses({super.key});

  final controller = Get.find<AddIncomeController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Expenses'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: ColorGradient.colorGradient(context)
          ),
        ),
      ),
      body: Obx(() {
        if(controller.expenses.isEmpty){
          return Expanded(child: Center(child: Text('No Expense Added')));
        }
        return ListView.builder(
            itemCount: controller.expenses.length,
            itemBuilder: (context, index) {
              final expense = controller.expenses[index];
              return Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (_) =>controller.deleteExpense(index),
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                      SlidableAction(
                        onPressed: (_){
                          final expenseController = TextEditingController(text: expense.new_expense);
                          final categoryController = TextEditingController(text: expense.category);

                          showDialog(context: context, builder: (context){
                            return EditExpense(
                                expense: expenseController,
                                category: categoryController,
                                onSave: (){
                                  final newExpense = expenseController.text;
                                  final newCategory = categoryController.text;

                                  controller.editExpense(index, newExpense, newCategory);
                                });
                          });
                        },
                        backgroundColor: Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  child: ExpenseCard(expense: expense));
            });
      })
    );
  }
}
