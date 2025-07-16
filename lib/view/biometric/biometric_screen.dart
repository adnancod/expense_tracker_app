import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view_model/controller/biometric_controller.dart';
import '../home_screen.dart';

class BiometricScreen extends StatefulWidget {
  const BiometricScreen({super.key});

  @override
  State<BiometricScreen> createState() => _BiometricScreenState();
}

class _BiometricScreenState extends State<BiometricScreen> {
  final BiometricController controller = Get.put(BiometricController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.authenticate();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.lock_outline, size: 30,),
                    SizedBox(height: 10,),
                    Text('Expense Tracker Locked')
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (controller.isLoading.value)
                        const CircularProgressIndicator()
                      else
                        TextButton(
                          onPressed: controller.authenticate,
                          child: const Text('UNLOCK WITH FINGERPRINT'),
                        ),
                    ],
                  ),
              ),
            )
          ],
        );
      }),
    );
  }
}
