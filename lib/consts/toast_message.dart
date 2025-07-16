import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage {
  static void show({
    required String message,
    Color bgColor = Colors.black,
    Color textColor = Colors.white,
    ToastGravity gravity = ToastGravity.BOTTOM,
    Toast length = Toast.LENGTH_SHORT,
    double fontSize = 16.0,
  }) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length,
      gravity: gravity,
      backgroundColor: bgColor,
      textColor: textColor,
      fontSize: fontSize,
    );
  }

  static void success(String message) {
    show(
      message: message,
      bgColor: Colors.green.shade600,
      textColor: Colors.white,
    );
  }

  static void error(String message) {
    show(
      message: message,
      bgColor: Colors.red.shade600,
      textColor: Colors.white,
    );
  }

  static void warning(String message) {
    show(
      message: message,
      bgColor: Colors.orange.shade700,
      textColor: Colors.white,
    );
  }

  static void info(String message) {
    show(
      message: message,
      bgColor: Colors.blue.shade600,
      textColor: Colors.white,
    );
  }
}
