import 'package:expense_tracker_app/consts/text_field_decoration.dart';
import 'package:expense_tracker_app/consts/text_fields.dart';
import 'package:expense_tracker_app/consts/toast_message.dart';
import 'package:expense_tracker_app/view/main_screen/add_expense/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../utils/color_gradient.dart';
import '../../../view_model/controller/income_controller/income_controller.dart';
import 'icon_picker_field.dart';

class AddExpense extends StatefulWidget {
  AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {

  final expenseController = TextEditingController();
  final categoryController = TextEditingController();

  final controller = Get.find<AddIncomeController>();

  @override
  void dispose() {
    // TODO: implement dispose
    expenseController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: ColorGradient.colorGradient(context)
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: FocusScope(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/expense.svg',height: 200,),
                SizedBox(height: 100,),
                Column(
                  children: [
                    Container(
                      decoration: textFieldDecoration(context),
                      child: myTextFormField(
                          context: context,
                          controller: expenseController,
                          keyboardType: TextInputType.number,
                          labelText: 'Add Expense',
                          hintText: '25000')
                    ),
                    SizedBox(height: 20,),
                    Container(
                        decoration: textFieldDecoration(context),
                        child: myTextFormField(
                            context: context,
                            controller: categoryController,
                            keyboardType: TextInputType.text,
                            labelText: 'Add Category',
                            hintText: 'e.g Food, Travel, Rent etc')
                    ),
                    SizedBox(height: 20,),
                    IconPickerField(controller: controller),
                    SizedBox(height: 20,),
                    CurrentDatePickerField(controller: controller),
                    SizedBox(height: 50,),
                    ElevatedButton(
                      onPressed: (){
                        if (expenseController.text.isEmpty ||
                            categoryController.text.isEmpty ||
                            controller.selectedDate.value == null ||
                            controller.selectedIcon.value == null) {
                          Get.snackbar('Error', 'Please fill all fields',
                            backgroundColor: Colors.redAccent,
                            colorText: Colors.white,
                          );
                          return;
                        }
                        controller.addExpense(
                            expenseController.text,
                            categoryController.text,
                            '${controller.selectedDate.value!.day}-${controller.selectedDate.value!.month}-${controller.selectedDate.value!.year}',
                            controller.selectedIcon.value!.codePoint);
                        expenseController.clear();
                        categoryController.clear();
                        controller.selectedDate.value = null;
                        controller.selectedIcon.value = null;
                        ToastMessage.success('Expense Added Successfully',);
                        Navigator.pop(context);
                      },
                      child: Text('Add Expense'),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
