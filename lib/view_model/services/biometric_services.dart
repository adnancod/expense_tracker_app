import 'package:flutter/cupertino.dart';
import 'package:local_auth/local_auth.dart';

class BiometricServices{
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> isBiometricsAvailable()async{
    try{
      return await auth.canCheckBiometrics;
    }catch(e){
      debugPrint('Biometrics check error: $e');
      return false;
    }
  }

  Future<bool> verifyFingerPrint({String? reason})async{
    try{
      return await auth.authenticate(
          localizedReason: reason ?? 'Verify your Identity',
        options: AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true
        )
      );
    }catch(e){
      debugPrint('Authentication error: $e');
      return false;
    }
  }
}