import 'package:flutter/material.dart';

TextFormField myTextFormField(
{required BuildContext context,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required String labelText,
    required String hintText}) => TextFormField(
  controller: controller,
  keyboardType: keyboardType,
  onTapOutside: (event) {
    FocusScope.of(context).unfocus();
  },
  decoration: InputDecoration(
    labelText: labelText,
    hintText: hintText,
    labelStyle: TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
    ),
    hintStyle: TextStyle(
      color: Theme.of(context).colorScheme.onSurface,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide.none, // remove default border
    ),
    filled: true,
    fillColor: Theme.of(context).brightness == Brightness.dark
        ? Colors.grey.shade900
        : Colors.white,
  ),
);
