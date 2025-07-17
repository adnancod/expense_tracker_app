import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../view/home_screen.dart';
import '../services/biometric_services.dart';

class BiometricController extends GetxController {
  final  _biometricServices = BiometricServices();

  RxBool isLoading = false.obs;
  RxBool isBiometricAvailable = false.obs;
  RxBool isAuthenticated = false.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Check biometric availability when controller initializes
    checkBiometrics();
    // ever(isAuthenticated, (bool isAuthed) {
    //   if (isAuthed) {
    //     Get.off(HomeScreen());
    //   }
    // });
  }

  Future<void> checkBiometrics() async {
    isLoading.value = true;
    errorMessage.value = 'Checking Biometrics...';
    try {
      isBiometricAvailable.value = await _biometricServices
          .isBiometricsAvailable();
      if (!isBiometricAvailable.value) {
        errorMessage.value = 'Biometrics not available';
        // await Future.delayed(const Duration(seconds: 2));
        // Get.off(HomeScreen());
        return;
      }

      // errorMessage.value = 'Ready for authentication';
      // await authenticate();
    } catch (e) {
      errorMessage.value = 'Error checking biometrics: $e';
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> authenticate({String? reason}) async {
    isLoading.value = true;
    errorMessage.value = 'Authenticating...';
    try {
      isAuthenticated.value = await _biometricServices.verifyFingerPrint(reason: reason?? 'Verify to continue');
      if (!isAuthenticated.value) {
        errorMessage.value = 'Authentication failed';
      }
      return isAuthenticated.value;
    } catch (e) {
      errorMessage.value = 'Authentication error: $e';
      isAuthenticated.value = false;
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
