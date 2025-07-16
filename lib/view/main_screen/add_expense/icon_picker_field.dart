import 'package:expense_tracker_app/view_model/controller/income_controller/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../consts/icon_list.dart';
import '../../../consts/text_field_decoration.dart';

class IconPickerField extends StatelessWidget {
  final AddIncomeController controller;
  const IconPickerField({super.key, required this.controller});

  void _showIconPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: iconOptions.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (_, index) {
          final icon = iconOptions[index];
          return GestureDetector(
            onTap: () {
              controller.selectIcon(icon);
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade200,
              child: Icon(icon, size: 28, color: Colors.black),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () => _showIconPicker(context),
        child: AbsorbPointer(
          child: Container(
            decoration: textFieldDecoration(context),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Select Icon',
                prefixIcon: Icon(
                  controller.selectedIcon.value ?? Icons.add_circle_outline,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none, // remove default border
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
