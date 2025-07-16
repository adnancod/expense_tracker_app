import 'package:expense_tracker_app/consts/toast_message.dart';
import 'package:expense_tracker_app/view/settings/add_fingerprint.dart';
import 'package:expense_tracker_app/view_model/controller/income_controller/income_controller.dart';
import 'package:expense_tracker_app/view_model/controller/switch/switch_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/color_gradient.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final controller = Get.find<SwitchController>();
  final incomeController = Get.find<AddIncomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: ColorGradient.colorGradient(context)
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Add Fingerprint', style: Theme.of(context).textTheme.bodyLarge),
              trailing: AddFingerprint(),
            ),
            ListTile(
              title: Text('Change Theme', style: Theme.of(context).textTheme.bodyLarge),
              trailing: Obx(() {
                return Switch(
                    value: controller.isThemeSwitched.value,
                    onChanged: (value) {
                      controller.toggleTheme(value);
                    });
              }),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(
                      title: Text('Clear Data'),
                      content: Text('Are you sure you want to clear data?'),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.pop(context);
                        }, child: Text('Cancel')),
                        TextButton(onPressed: () {
                          incomeController.clearData();
                          ToastMessage.info('Data Cleared Successfully');
                          Navigator.pop(context);
                        }, child: Text('Clear'))
                      ],
                    );
                  });
                },
                child: Text('Clear Data'))
          ],
        ),
      ),
    );
  }
}
