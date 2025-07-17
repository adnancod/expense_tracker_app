import 'package:expense_tracker_app/consts/toast_message.dart';
import 'package:expense_tracker_app/view_model/services/biometric_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/controller/biometric_controller.dart';
import '../../view_model/controller/switch/switch_controller.dart';


class AddFingerprint extends StatelessWidget {
  final biometricServices = BiometricServices();
  final biometricController = Get.put(BiometricController());
  final switchController = Get.find<SwitchController>();

  AddFingerprint({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Switch(
          value: switchController.isSwitched.value,
          onChanged: (bool value) async{
            // switchController.toggleSwitch(value);
            final isVerified = await biometricController.authenticate(
                reason: 'Verify to continue'
            );

            if (isVerified) {
              switchController.toggleSwitch(value);
              ToastMessage.success('Finger Print Verified');
            } else {
              ToastMessage.error('Biometrics Not available\nFinger Print Verification Failed');
            }
          });
    });
  }
}
