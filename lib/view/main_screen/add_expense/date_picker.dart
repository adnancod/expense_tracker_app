import 'package:expense_tracker_app/consts/text_field_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;
import '../../../view_model/controller/income_controller/income_controller.dart';


class CurrentDatePickerField extends StatelessWidget {
  final AddIncomeController controller;

  const CurrentDatePickerField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: (){
          picker.DatePicker.showDatePicker(context,
          showTitleActions: true,
          maxTime: DateTime.now(),
          onConfirm: (date) => controller.setDateTime(date),
          currentTime: controller.selectedDate.value ?? DateTime.now(),
          locale: picker.LocaleType.en);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          decoration: textFieldDecoration(context),
          child: Row(
            children: [
              const Icon(Icons.calendar_today),
              const SizedBox(width: 10),
              Text(controller.selectedDate.value != null
                  ? '${controller.selectedDate.value!.day}/${controller.selectedDate.value!.month}/${controller.selectedDate.value!.year}'
                  : 'Select Date')
            ],
          ),
        ),
      );
    });
  }
}
