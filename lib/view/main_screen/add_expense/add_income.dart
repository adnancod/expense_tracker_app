import 'package:expense_tracker_app/consts/text_field_decoration.dart';
import 'package:expense_tracker_app/consts/toast_message.dart';
import 'package:expense_tracker_app/utils/color_gradient.dart';
import 'package:expense_tracker_app/view_model/controller/income_controller/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddIncome extends StatefulWidget {
  const AddIncome({super.key});

  @override
  State<AddIncome> createState() => _AddIncomeState();
}

class _AddIncomeState extends State<AddIncome> {
  final incomeController = TextEditingController();
  final controller = Get.find<AddIncomeController>();

  @override
  void dispose() {
    // TODO: implement dispose
    incomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: ColorGradient.colorGradient(context)
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/Income.svg', height: MediaQuery.of(context).size.height * 0.25,),
              SizedBox(height: 100,),
              Column(
                children: [
                  Container(
                    decoration: textFieldDecoration(context),
                    child: TextFormField(
                      controller: incomeController,
                      keyboardType: TextInputType.number,
                      onTapOutside: (event){
                        FocusScope.of(context).unfocus();
                      },
                      decoration: InputDecoration(
                        labelText: 'Enter Income',
                        hintText: '30000',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey.shade900
                            : Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  ElevatedButton(
                    onPressed: (){
                      final income = incomeController.text.trim();
                      if (income.isEmpty || int.tryParse(income) == null) {
                        ToastMessage.warning("Please enter a valid number.");
                        return;
                      }
                      controller.addIncome(income);
                      incomeController.clear();
                      ToastMessage.success('Income added Successfully');
                      Navigator.pop(context);
                    },
                    child: Text('Add Income'),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
